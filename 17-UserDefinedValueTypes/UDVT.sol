// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title User Defined Value Types & Packed Struct Encoding
/// @dev Demonstrates how to safely handle related data using UDVTs and bitwise packing

/// -------------------------
/// Without UDVT (Unsafe)
/// -------------------------
contract WithoutUDVT {
    uint64 public age;
    uint64 public weight;

    function setDetails(uint64 _age, uint64 _weight) public {
        // ❌ Bug: values accidentally swapped
        age = _weight;
        weight = _age;
    }
}

/// -------------------------
/// With UDVT (Safe)
/// -------------------------
type Age is uint64;
type Weight is uint64;

contract WithUDVT {
    Age public age;
    Weight public weight;

    function setDetails(Age _age, Weight _weight) public {
        age = _age;
        weight = _weight;
    }

    function getAge() public view returns (uint64) {
        return Age.unwrap(age);
    }

    function getWeight() public view returns (uint64) {
        return Weight.unwrap(weight);
    }
}

/// -------------------------
/// Bit-level Encoding with UDVT
/// -------------------------
type Duration is uint64;
type Timestamp is uint64;
type Clock is uint128;

/// @dev Library to pack Duration + Timestamp into Clock using bitwise ops
library LibClock {
    function wrap(Duration _duration, Timestamp _timestamp)
        internal
        pure
        returns (Clock clock_)
    {
        assembly {
            // Shift duration left 64 bits and OR it with timestamp
            clock_ := or(shl(0x40, _duration), _timestamp)
        }
    }

    function duration(Clock _clock) internal pure returns (Duration duration_) {
        assembly {
            duration_ := shr(0x40, _clock) // Extract high 64 bits
        }
    }

    function timestamp(Clock _clock) internal pure returns (Timestamp timestamp_) {
        assembly {
            timestamp_ := shr(0xC0, shl(0xC0, _clock)) // Extract low 64 bits
        }
    }
}

/// @dev Same logic as LibClock but without UDVT safety (uses plain uint64)
library LibClockBasic {
    function wrap(uint64 _duration, uint64 _timestamp)
        internal
        pure
        returns (uint128 clock)
    {
        assembly {
            clock := or(shl(0x40, _duration), _timestamp)
        }
    }
}

/// -------------------------
/// Example Use Cases
/// -------------------------
contract Examples {
    function example_no_uvdt() external pure returns (uint128 clock) {
        // Without UDVT: works but no type safety
        uint64 d = 1;
        uint64 t = uint64(block.timestamp);

        // Both compile, even if arguments are swapped
        clock = LibClockBasic.wrap(d, t);
        clock = LibClockBasic.wrap(t, d); // ❌ Wrong, but compiles
    }

    function example_uvdt() external view returns (
        uint64 d_u64,
        uint64 t_u64,
        uint128 clockPacked
    ) {
        // With UDVT: safer code
        Duration d = Duration.wrap(1);
        Timestamp t = Timestamp.wrap(uint64(block.timestamp));

        // Convert back to primitive types
        d_u64 = Duration.unwrap(d);
        t_u64 = Timestamp.unwrap(t);

        // Safe usage with LibClock
        Clock clock = LibClock.wrap(d, t);
        clockPacked = Clock.unwrap(clock);

        // This won't compile: ensures safety at compile time
        // clock = LibClock.wrap(t, d);
    }
}

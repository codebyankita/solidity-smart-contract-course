// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title EncodingLab
 * @dev Demonstrates different types of ABI encoding in Solidity:
 *      - abi.encode()
 *      - abi.encodePacked()
 *      - bytes()
 */
contract EncodingLab {
    /**
     * @notice Encodes a string using abi.encode()
     * @dev Returns 96 bytes of structured ABI-encoded data.
     *      This format includes padding, offset, and length — making it decodable.
     * @return Encoded bytes of the string "hello"
     */
    function encodeFull() public pure returns (bytes memory) {
        return abi.encode("hello");
    }

    /**
     * @notice Encodes another string example using abi.encode()
     * @dev Same as above but with a different string.
     */
    function encodeString() public pure returns (bytes memory) {
        return abi.encode("some thing");
    }

    /**
     * @notice Encodes the string using abi.encodePacked()
     * @dev Returns tightly packed bytes — no padding or length info.
     *      Useful for hashing but unsafe for decoding.
     */
    function encodePacked() public pure returns (bytes memory) {
        return abi.encodePacked("hello");
    }

    /**
     * @notice Converts the string directly to bytes
     * @dev Similar to encodePacked for single strings. Returns UTF-8 bytes.
     */
    function encodeBytes() public pure returns (bytes memory) {
        return bytes("hello");
    }
}

/**
 * @title MultiEncodingLab
 * @dev Demonstrates encoding and decoding multiple values (strings).
 *      Shows why abi.encodePacked() is unsafe for dynamic data.
 */
contract MultiEncodingLab {
    /**
     * @notice Encodes two strings safely using abi.encode()
     * @dev Structured, decodable, and ABI-compliant.
     */
    function multiEncode() public pure returns (bytes memory) {
        return abi.encode("hello", "world");
    }

    /**
     * @notice Decodes the encoded data back into two strings
     * @dev Works perfectly because the encoding included offsets and lengths.
     * @return The original two strings ("hello", "world")
     */
    function multiDecode() public pure returns (string memory, string memory) {
        return abi.decode(multiEncode(), (string, string));
    }

    /**
     * @notice Encodes the same strings using abi.encodePacked()
     * @dev This merges the two strings ("helloworld") and removes all structure.
     */
    function multiEncodePacked() public pure returns (bytes memory) {
        return abi.encodePacked("hello", "world");
    }

    /**
     * @notice Tries to decode packed data (incorrectly)
     * @dev Returns just "helloworld" because boundaries are lost.
     *      Demonstrates the danger of abi.encodePacked() for dynamic types.
     */
    function multiDecodePacked() public pure returns (string memory) {
        return string(multiEncodePacked());
    }
}

/**
 * @title MyContract
 * @dev Simple contract demonstrating how constructor arguments are encoded
 *      during contract deployment.
 */
contract MyContract {
    string public name;
    uint256 public value;

    /**
     * @notice Constructor with parameters
     * @dev When you deploy this contract, the compiler ABI-encodes
     *      (_name, _value) and appends them to the bytecode.
     * @param _name A string stored in state
     * @param _value A numeric value stored in state
     */
    constructor(string memory _name, uint256 _value) {
        name = _name;
        value = _value;
    }
}

/**
 * @title FunctionCallEncode
 * @dev Demonstrates how function calls are ABI-encoded
 *      (selector + arguments).
 */
contract FunctionCallEncode {
    uint256 public storeValue;

    /**
     * @notice Normal state-changing function
     */
    function setValue(uint256 newValue) public {
        storeValue = newValue;
    }

    /**
     * @notice Returns ABI-encoded call data for setValue(uint256)
     * @dev The output is what your wallet actually sends in the tx data field:
     *      [4-byte selector][encoded argument]
     * @param newValue The value to encode
     */
    function encodeSetValue(uint256 newValue) public pure returns (bytes memory) {
        return abi.encodeWithSignature("setValue(uint256)", newValue);
    }
}

/**
 * @title EvmMaster
 * @dev Combines multiple encoding examples including
 *      abi.encode, abi.encodeWithSelector, and abi.encodePacked + keccak256
 */
contract EvmMaster {
    /// @dev Emits encoded data for visual debugging in Remix or logs.
    event Log(bytes data, string label);

    /**
     * @notice Demonstrates how constructor args are encoded
     * @dev Returns bytes equivalent to abi.encode("CodeByAnkita", 100)
     */
    function deployDemo() public pure returns (bytes memory) {
        return abi.encode("CodeByAnkita", uint256(100));
    }

    /**
     * @notice Encodes a function call manually using abi.encodeWithSelector
     * @dev Builds the calldata for a function named "set(uint256)"
     * @param x The argument value
     */
    function callDemo(uint256 x) public pure returns (bytes memory) {
        // Selector = first 4 bytes of keccak256("set(uint256)")
        return abi.encodeWithSelector(bytes4(keccak256("set(uint256)")), x);
    }

    /**
     * @notice Hashes two strings using packed encoding
     * @dev Commonly used in off-chain signatures and proofs.
     *      Avoids the cost of full ABI padding.
     * @param a First string
     * @param b Second string
     * @return The keccak256 hash of the packed data
     */
    function packedHash(string memory a, string memory b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }
}

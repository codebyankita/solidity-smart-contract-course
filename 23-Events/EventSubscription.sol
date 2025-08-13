// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/// @title Event Subscription and Real-Time Updates
/// @notice Allows contracts or users to subscribe to transfer events
interface IEventSubscriber {
    function handleTransferEvent(address from, address to, uint256 value) external;
}

/// @title Event Subscription Contract
/// @notice Manages subscribers and broadcasts transfer events to them
contract EventSubscription {
    /// @dev Logs every transfer made
    event LogTransfer(address indexed from, address indexed to, uint256 value);

    /// @notice Keeps track of whether an address is subscribed
    mapping(address => bool) public subscribers;

    /// @notice Stores the list of subscriber addresses
    address[] public subscriberList;

    /// @notice Subscribes the caller to transfer notifications
    function subscribe() public {
        require(!subscribers[msg.sender], "Already subscribed");

        subscribers[msg.sender] = true;
        subscriberList.push(msg.sender);
    }

    /// @notice Unsubscribes the caller from notifications
    function unsubscribe() public {
        require(subscribers[msg.sender], "Not subscribed");

        subscribers[msg.sender] = false;

        // Remove from subscriberList array
        for (uint256 i = 0; i < subscriberList.length; i++) {
            if (subscriberList[i] == msg.sender) {
                subscriberList[i] = subscriberList[subscriberList.length - 1];
                subscriberList.pop();
                break;
            }
        }
    }

    /// @notice Transfers value and notifies all subscribers
    /// @param to Recipient address
    /// @param value Amount to transfer
    function transfer(address to, uint256 value) public {
        // Emit transfer log for event listeners
        emit LogTransfer(msg.sender, to, value);

        // Notify all subscriber contracts
        for (uint256 i = 0; i < subscriberList.length; i++) {
            IEventSubscriber(subscriberList[i]).handleTransferEvent(
                msg.sender,
                to,
                value
            );
        }
    }
}

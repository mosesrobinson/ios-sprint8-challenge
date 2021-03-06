//
//  MessageThreadTests.swift
//  MessageBoardTests
//
//  Created by Andrew R Madsen on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest
@testable import Message_Board

class MessageThreadTests: XCTestCase {
    
    override func setUp() {
        messageThreadController = MessageThreadController()
    }
    
    func testCreatingMessageThread() {
        
        messageThreadController.createMessageThread(with: "Test Thread") {
            
            let messageThreads = self.messageThreadController.messageThreads
            XCTAssertGreaterThan(messageThreads.count, 0)
        }
    }
    
    func testCreatingMessage() {
        
        messageThreadController.createMessageThread(with: "Test Thread") {
            
            let messageThreads = self.messageThreadController.messageThreads
            guard let messageThread = messageThreads.first else { return }
            
            self.messageThreadController.createMessage(in: messageThread, withText: "Is this message here?", sender: "Moses", completion: {
                let messages = messageThread.messages
                XCTAssertGreaterThan(messages.count, 0)
            })
        }
    }
    
    func testFetchingMessageThreadsFromServer() {
        
        messageThreadController.createMessageThread(with: "Test Thread") {
            
            let messageThreads = self.messageThreadController.messageThreads
            guard let messageThread = messageThreads.first else { return }
            
            print("\(messageThread.title)")
            
            self.messageThreadController.createMessage(in: messageThread, withText: "Is this message here?", sender: "Moses", completion: {
                let messages = messageThread.messages
                XCTAssertGreaterThan(messages.count, 0)
            })
        }
        
        messageThreadController.fetchMessageThreads {
            let messageThreads = self.messageThreadController.messageThreads
            XCTAssertGreaterThan(messageThreads.count, 0)
        }
    }
    
    var messageThreadController: MessageThreadController!
}

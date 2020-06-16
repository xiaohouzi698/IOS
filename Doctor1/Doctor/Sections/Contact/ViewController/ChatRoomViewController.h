//
//  ChatRoomViewController.h
//  BRSF
//
//  Created by mac on 16/3/9.
//  Copyright © 2016年 HongTao. All rights reserved.
//
//#import "JSQMessagesCollectionView.h"

#import "JSQMessages.h"
#import "DWXMPP_Header.h"
#import "XMPP.h"

@class ChatRoomViewController;


@protocol JSQDemoViewControllerDelegate <NSObject>

- (void)didDismissJSQDemoViewController:(ChatRoomViewController *)vc;

@end

@interface ChatRoomViewController : JSQMessagesViewController<NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) id<JSQDemoViewControllerDelegate> delegateModal;

@property (strong, nonatomic) NSMutableArray *messages;
@property (copy, nonatomic) NSDictionary *avatars;

@property (strong, nonatomic) UIImageView *outgoingBubbleImageView;
@property (strong, nonatomic) UIImageView *incomingBubbleImageView;

@property (strong, nonatomic) XMPPUserCoreDataStorageObject *senderInfo;
@property (strong, nonatomic) XMPPUserCoreDataStorageObject *friendInfo;

@property (strong, nonatomic) XMPPJID *friendJID;


- (void)receiveMessagePressed:(UIBarButtonItem *)sender;

- (void)closePressed:(UIBarButtonItem *)sender;

- (void)setupTestModel;

@end

//
//  Client.h
//  wk
//
//  Created by David Sansome on 22/11/17.
//  Copyright © 2017 David Sansome. All rights reserved.
//

#include "proto/Wanikani.pbobjc.h"

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

extern NSErrorDomain WKClientErrorDomain;

@interface Client : NSObject

- (instancetype)initWithApiToken:(NSString *)apiToken
                          cookie:(NSString *)cookie NS_DESIGNATED_INITIALIZER;
- (instancetype)init NS_UNAVAILABLE;

- (NSString *)currentISO8601Time;

typedef void (^AssignmentHandler)(NSError * _Nullable error,
                                  NSArray<WKAssignment *> * _Nullable assignments);
- (void)getAssignmentsModifiedAfter:(NSString *)date
                            handler:(AssignmentHandler)handler;

typedef void (^ProgressHandler)(NSError * _Nullable error);
- (void)sendProgress:(NSArray<WKProgress *> *)progress
             handler:(ProgressHandler)handler;

@end

NS_ASSUME_NONNULL_END
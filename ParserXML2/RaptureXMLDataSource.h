//
//  RaptureXMLDataSource.h
//  ParserXML2
//
//  Created by Antonio Trejo on 09/03/13.
//  Copyright (c) 2013 Antonio Trejo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RXMLElement;

typedef void(^RaptureXMLDataSourceBlock)();

@interface RaptureXMLDataSource : NSObject

- (RXMLElement *) channel;
- (NSArray *) items;
- (NSInteger) numberOfitems;
- (NSString *) titleAtIndex:(NSInteger) index;
- (NSString *) contentAtIndex:(NSInteger) index;
- (id) initWithBlock:(RaptureXMLDataSourceBlock) block;

@end

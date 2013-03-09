//
//  NSXMLDataSource.h
//  ParserXML2
//
//  Created by Antonio Trejo on 09/03/13.
//  Copyright (c) 2013 Antonio Trejo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSXMLDataSource : NSObject

- (NSString *) channel;
- (NSArray *) items;
- (NSInteger) numberOfitems;
- (NSString *) titleAtIndex:(NSInteger) index;
- (NSString *) contentAtIndex:(NSInteger) index;

@end

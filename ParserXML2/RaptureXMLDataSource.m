//
//  RaptureXMLDataSource.m
//  ParserXML2
//
//  Created by Antonio Trejo on 09/03/13.
//  Copyright (c) 2013 Antonio Trejo. All rights reserved.
//

#import "RaptureXMLDataSource.h"
#import "RXMLElement.h"
@interface RaptureXMLDataSource ()

@property (nonatomic, strong) NSMutableArray *allItems;
@property (nonatomic, strong) RXMLElement *rootXML;
@end

@implementation RaptureXMLDataSource

- (id) initWithBlock:(RaptureXMLDataSourceBlock) block{
    
    if(self = [super init]){

        //proceso de descargar asincrono
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0),^{
            
            NSURL *url = [NSURL URLWithString:kFeed];
            NSData *data = [NSData dataWithContentsOfURL:url];
            
            self.rootXML = [RXMLElement elementFromXMLData:data];
            
            block();
            
        });
        
    }
    
    return self;
    
}


- (NSMutableArray *) allItems{
    
    if(!_allItems){
        
        _allItems = [[NSMutableArray alloc] init];
        
    }
    
    return _allItems;
}

- (RXMLElement *) channel{
    return [self.rootXML child:@"channel"];
}
- (NSArray *) items{
    return [[self channel] children:@"item"];
}
- (NSInteger) numberOfitems{
    
    return [self items].count;
    
}
- (NSString *) titleAtIndex:(NSInteger) index{
    
    RXMLElement *item = self.items[index];
    return [[item child:@"title"] text];
    
}

- (NSString *) contentAtIndex:(NSInteger) index{
    RXMLElement *item = self.items[index];
    return [[item child:@"description"] text];
}

- (NSString *) audioAtIndex:(NSInteger) index{
    RXMLElement *item = self.items[index];
    return [[item child:@"guid"] text];
}


@end

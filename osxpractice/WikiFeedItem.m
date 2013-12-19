//
//  WikiFeedItem.m
//  osxpractice
//
//  Created by Alex on 18/12/2013.
//  Copyright (c) 2013 Espian(dev). All rights reserved.
//

#import "WikiFeedItem.h"
#import "XMLReader.h"

@implementation WikiFeedItem

+(instancetype)initWithDictionary:(NSDictionary*)itemDictionary
{
    WikiFeedItem *item = [[WikiFeedItem alloc] init];
    
    item.imageUrl = [[NSURL alloc] initWithString:[itemDictionary objectForKey:@"link"]];
    
    return item;
}

@end

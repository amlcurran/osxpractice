//
//  WikiFeedItem.h
//  osxpractice
//
//  Created by Alex on 18/12/2013.
//  Copyright (c) 2013 Espian(dev). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WikiFeedItem : NSObject

@property NSURL *imageUrl;

+(instancetype)initWithDictionary:(NSDictionary*)itemDictionary;

@end

//
//  AppDelegate.m
//  osxpractice
//
//  Created by Alex on 18/12/2013.
//  Copyright (c) 2013 Espian(dev). All rights reserved.
//

#import "AppDelegate.h"
#import "XMLReader.h"
#import "WikiFeedItem.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}
- (void)parseWeatherData:(NSData *)data {
//    NSString *stringResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    NSArray *lines = [stringResult componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
//    NSString *imageUrl = [lines objectAtIndex:3];
//    NSURLRequest *imageRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:imageUrl]];
//    [NSURLConnection sendAsynchronousRequest:imageRequest queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
//     {
//         NSImage *image = [[NSImage alloc] initWithData:data];
//         [_weatherImage setImage:image];
//         
//     }];
//    [_result setStringValue:stringResult];
}

- (IBAction)buttonClick:(id)sender {
    // http://www.feathersquare.com/data/OxWeather.dat
    
    NSURL *feedUrl = [NSURL URLWithString:@"http://tools.wmflabs.org/catfood/catfood.php?category=Featured_pictures_on_Wikimedia_Commons"];
    NSURLRequest *feedRequest = [[NSURLRequest alloc] initWithURL:feedUrl];
    [NSURLConnection sendAsynchronousRequest:feedRequest queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError)
    {
        [self parseFeed:data];
    }];
    
}

-(void)parseFeed: (NSData *)data
{
    NSDictionary *fullDictionary = [XMLReader dictionaryForXMLData:data error:nil];
    if (fullDictionary)
    {
        NSArray *items = [fullDictionary objectForKey:@"item"];
        NSLog(@"%@", items);
        NSMutableArray *wikiItems = [[NSMutableArray alloc] init];
        for (int i = 0; i < [items count]; i++) {
            WikiFeedItem *feedItem = [WikiFeedItem initWithDictionary:[items objectAtIndex:i]];
            [wikiItems addObject:feedItem];
        }
        NSLog(@"%@", wikiItems);
        
        NSMutableString *urls = [[NSMutableString alloc] init];
        [wikiItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            WikiFeedItem *feedItem = obj;
            [urls appendString:[NSString stringWithContentsOfURL:feedItem.imageUrl encoding:NSUTF8StringEncoding error:nil]];
        }];
    }
}

@end

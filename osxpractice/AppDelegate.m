//
//  AppDelegate.m
//  osxpractice
//
//  Created by Alex on 18/12/2013.
//  Copyright (c) 2013 Espian(dev). All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}
- (void)parseWeatherData:(NSData *)data {
    NSString *stringResult = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *lines = [stringResult componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    NSString *imageUrl = [lines objectAtIndex:3];
    NSURLRequest *imageRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:imageUrl]];
    [NSURLConnection sendAsynchronousRequest:imageRequest queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         NSImage *image = [[NSImage alloc] initWithData:data];
         [_weatherImage setImage:image];
         
     }];
    [_result setStringValue:stringResult];
}

- (IBAction)buttonClick:(id)sender {
    // http://www.feathersquare.com/data/OxWeather.dat
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"http://www.feathersquare.com/data/OxWeather.dat"]];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue currentQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error)
     {
         [self parseWeatherData:data];
     }];
}

@end

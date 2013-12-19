//
//  AppDelegate.h
//  osxpractice
//
//  Created by Alex on 18/12/2013.
//  Copyright (c) 2013 Espian(dev). All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;@property (weak) IBOutlet NSImageView *weatherImage;
@property (unsafe_unretained) IBOutlet NSTextView *result;

@end

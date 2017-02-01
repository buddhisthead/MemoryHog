//
//  MemHogViewController.m
//  Memory Hog
//
//  Created by Christopher Tilt on 3/23/12.
//  Copyright (c) 2012 Avatron Software. All rights reserved.
//

#import "MemHogViewController.h"

@implementation MemHogViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
    NSLog(@"Received low memory warning");
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    fiveMegChunks = [[NSMutableArray alloc] init];
    tenMegChunks = [[NSMutableArray alloc] init];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.allocatedLabel = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void) allocateChunkSize: (long)size
{
    long absSize = size < 0 ? -(size) : size;
    NSMutableArray *array = (absSize == HUNDRED_MEG ? tenMegChunks : fiveMegChunks);
    if( size > 0 )
    {
        // allocate memory
        void *chunk = malloc(size);
        if( chunk == NULL )
        {
            NSLog(@"Failed to allocate %ld bytes", size);
        }
        else
        {
            [array addObject:[NSValue valueWithPointer: chunk]];
            NSLog(@"Allocated %ld bytes", size);
        }
    }
    else
    {
        // free memory
        if( [array count] > 0 )
        {
            NSValue *value = [array objectAtIndex:0];
            void *chunk = [value pointerValue];
            if( chunk != NULL )
            {
                free(chunk);
                NSLog(@"Freed %ld bytes", absSize);
            }
            [array removeObjectAtIndex:0];
        }
    }
}

- (IBAction) allocationButtonPressed:(id)sender
{
    long size = ( sender == self.plus5MBButton
                   ? FIVE_MEG
                   : ( sender == self.plus1MBButton
                      ? HUNDRED_MEG
                      : ( sender == self.minus5MBButton
                         ? -(FIVE_MEG)
                         : -(HUNDRED_MEG)
                         )
                      )
                   );
    [self allocateChunkSize: size];
    
    int nTenMegChunks = [tenMegChunks count];
    int nFiveMegChunks = [fiveMegChunks count];
    
    float sizeMB = (((float )nTenMegChunks * 100.0) + ((float )nFiveMegChunks * 5.0));
    NSString *msg = [NSString stringWithFormat:@"%.1f", sizeMB];
    self.allocatedLabel.text = msg;
}

@synthesize plus5MBButton;
@synthesize minus5MBButton;
@synthesize plus1MBButton;
@synthesize minus1MBButton;
@synthesize allocatedLabel;

@end

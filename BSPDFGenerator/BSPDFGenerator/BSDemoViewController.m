//
//  BSDemoViewController.m
//  BSPDFGenerator
//
//  Created by Bilal on 5/14/14.
//  Copyright (c) 2014 MSquared. All rights reserved.
//

#import "BSDemoViewController.h"
#import "BSPDFGenerator.h"
#import <QuickLook/QuickLook.h>

@interface BSDemoViewController ()<QLPreviewControllerDataSource, QLPreviewControllerDelegate>{
    NSURL *pdfURL;
}

@end

@implementation BSDemoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.title = @"PDF Generator";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)createPDFPressed:(id)sender {
    BSPDFGenerator *pdfGenerator = [[BSPDFGenerator alloc] init];
    pdfURL = [pdfGenerator createPDFWithName:@"sample"];
    
    
    //Preview the PDF
    QLPreviewController *previewController = [[QLPreviewController alloc] init];
    [previewController setDataSource:self];
    [self presentViewController:previewController animated:YES completion:nil];
}


#pragma mark - QLPreviewController Delegate methods
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    return pdfURL;
}

- (void)previewControllerDidDismiss:(QLPreviewController *)controller{
    pdfURL = nil;
}
@end

//
//  BSPDFGenerator.m
//  BSPDFGenerator
//
//  Created by Bilal S on 20/05/14.
//  Copyright (c) 2014 MSquared. All rights reserved.
//

#import "BSPDFGenerator.h"
#define PortraitPageRect CGRectMake(0, 0, 850, 1100)

@interface BSPDFGenerator ()
{
    CGContextRef pdfContext;
    CGRect pageRect;

}
@end

@implementation BSPDFGenerator

- (void)setFont:(UIFont *)font{
    CGContextSelectFont(pdfContext, [font.fontName UTF8String], font.pointSize, kCGEncodingMacRoman);
}


- (NSURL *)createPDFWithName:(NSString *)filename{
    
    CFStringRef path;
    CFURLRef url;
    
    NSString *directory = NSTemporaryDirectory();
    
    NSString *filePath = [directory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.pdf", filename]];
    

    path = CFStringCreateWithCString (NULL, [filePath UTF8String],
                                      kCFStringEncodingUTF8);
    url = CFURLCreateWithFileSystemPath (NULL, path, // 1
                                         kCFURLPOSIXPathStyle, 0);
    CFRelease (path);
    
    CFMutableDictionaryRef attributes = NULL;
    
    attributes = CFDictionaryCreateMutable(NULL, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(attributes, kCGPDFContextCreator,CFSTR("Bilal"));
    CFDictionarySetValue(attributes, kCGPDFContextTitle, CFSTR("Test PDF"));
    
    
    pageRect = PortraitPageRect;
    pdfContext = CGPDFContextCreateWithURL (url, &pageRect, attributes);
    CFRelease(attributes);

    CGContextBeginPage(pdfContext, &(pageRect));
    
    [self setFont:[UIFont fontWithName:@"HelveticaNeue-CondensedBold" size:45]];
    CGContextSetTextDrawingMode(pdfContext, kCGTextFill);
    CGContextShowTextAtPoint(pdfContext, 100, 250, "Welcome", 7);
    
    CGContextEndPage(pdfContext);
    
    CGContextRelease(pdfContext);
   
    return (__bridge NSURL *)(url);
}
@end


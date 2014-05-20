//
//  BSPDFGenerator.h
//  BSPDFGenerator
//
//  Created by Bilal S on 20/05/14.
//  Copyright (c) 2014 MSquared. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSPDFGenerator : NSObject

- (NSURL *)createPDFWithName:(NSString *)filename;

@end
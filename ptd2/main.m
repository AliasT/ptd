//
//  main.m
//  ptd2
//
//  Created by ryan on 2021/11/11.
//

#import <Foundation/Foundation.h>
#include <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    NSString* dest = [NSString stringWithUTF8String: argv[1]];
    NSData* data = [NSPasteboard.generalPasteboard dataForType:NSPasteboardTypeTIFF];
    NSError* error;
    NSData* compressed = [data compressedDataUsingAlgorithm:NSDataCompressionAlgorithmLZFSE error:&error];
    NSURL* to = [NSURL fileURLWithPath:dest];
    [compressed writeToURL:to atomically:YES];
    return 0;
}

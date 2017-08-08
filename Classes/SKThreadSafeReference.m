//
//  SKThreadSafeReference.m
//  SKThreadSafeReference
//
//  Created by Stepan Kopylov on 08/08/2017.
//  Copyright © 2017 Home. All rights reserved.
//

#import "SKThreadSafeReference.h"

@implementation SKThreadSafeReference

+ (instancetype)referenceWithThreadConfined:(id<RLMThreadConfined>)threadConfined
{
    SKThreadSafeReference *reference = [SKThreadSafeReference new];
    
    reference.reference = [RLMThreadSafeReference referenceWithThreadConfined:threadConfined];
    reference.realmConfiguration = threadConfined.realm.configuration;
    
    if ( reference ) {
        return reference;
    }
    
    return nil;
}


- (id)nonSafeObject
{
    NSError *error;
    
    RLMRealm *realm = [RLMRealm realmWithConfiguration:self.realmConfiguration error:&error];
    
    if ( !error ) {
        RLMObject *object = [realm resolveThreadSafeReference:self.reference];
        
        return object;
    }
    
    return nil;
}


@end

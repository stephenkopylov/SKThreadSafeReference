//
//  SKThreadSafeReference.h
//  SKThreadSafeReference
//
//  Created by Stepan Kopylov on 08/08/2017.
//  Copyright © 2017 Home. All rights reserved.
//

#import <Realm/Realm.h>

@interface SKThreadSafeReference : NSObject

@property (nonatomic) RLMThreadSafeReference *reference;
@property (nonatomic) RLMRealmConfiguration *realmConfiguration;
@property (nonatomic) id nonSafeObject;

+ (instancetype)referenceWithThreadConfined:(id<RLMThreadConfined>)threadConfined;

@end

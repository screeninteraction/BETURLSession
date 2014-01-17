
#import "SIURLSessionRequestSerializerJSON.h"


@interface SIURLSessionRequestSerializerJSON ()
@property(nonatomic,assign) NSJSONWritingOptions JSONWritingOptions;
@end

@implementation SIURLSessionRequestSerializerJSON
@synthesize contentTypeHeader = _contentTypeHeader;

-(instancetype)init; {
  self = [super init];
  if(self) {
    _contentTypeHeader =  [NSString stringWithFormat:@"application/json; charset=%@", self.charset] ;
  }
  return self;
}

+(instancetype)serializerWithJSONWritingOptions:(NSJSONWritingOptions)theJSONWritingOptions; {
  SIURLSessionRequestSerializerJSON * serializer = [[self alloc] init];
  serializer.JSONWritingOptions = theJSONWritingOptions;
  return serializer;
}


-(void)buildRequest:(NSURLRequest *)theRequest
     withParameters:(NSDictionary *)theParameters
       onCompletion:(SIURLSessionSerializerErrorBlock)theBlock; {
  
  NSParameterAssert(theRequest);
  NSParameterAssert(theBlock);
  if ([self.acceptableHTTPMethodsForURIEncoding containsObject:theRequest.HTTPMethod.uppercaseString]) {
    [super buildRequest:theRequest withParameters:theParameters onCompletion:theBlock];
  }
  
  else {
    NSMutableURLRequest * newRequest = theRequest.mutableCopy;;
    NSError * error = nil;
    [newRequest setHTTPBody:[NSJSONSerialization dataWithJSONObject:theParameters options:self.JSONWritingOptions error:&error]];
    theBlock(newRequest,error);
  }
  
  
  
}


@end
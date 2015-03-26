
#import <Foundation/Foundation.h>
#import "SectionHeaderView.h"
#import "Processsectionheaderview.h"

@interface Section : NSObject 
@property (nonatomic, strong) SectionHeaderView *sectionHeaderView;
@property (nonatomic, strong) Processsectionheaderview *newsectionHeaderView;
@property (nonatomic, strong) NSString *sectionHeader;
@property (nonatomic, strong) NSString * sectionname;
//example
@property (nonatomic, strong) NSMutableArray *sectionRows;
@property (nonatomic) BOOL open;

@end

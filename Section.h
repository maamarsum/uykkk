
#import <Foundation/Foundation.h>
#import "SectionHeaderView.h"
#import "Processsectionheaderview.h"
// github test by maneesh
@interface Section : NSObject 
@property (nonatomic, strong) SectionHeaderView *sectionHeaderView;
@property (nonatomic, strong) Processsectionheaderview *newsectionHeaderView;
@property (nonatomic, strong) NSString *sectionHeader;
@property (nonatomic, strong) NSString * sectionname;

@property (nonatomic, strong) NSMutableArray *sectionRows;
@property (nonatomic) BOOL open;
//new line
@end

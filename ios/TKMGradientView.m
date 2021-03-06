// Copyright 2018 David Sansome
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#import "TKMGradientView.h"

@implementation TKMGradientView

@dynamic layer;

+ (Class)layerClass {
  return [CAGradientLayer class];
}

- (void)animateColorsTo:(NSArray *)toColors duration:(NSTimeInterval)duration {
  NSArray *oldColors = self.layer.colors;
  self.layer.colors = toColors;
  CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"colors"];
  animation.duration = duration;
  animation.fromValue = oldColors;
  animation.toValue = toColors;
  animation.fillMode = kCAFillModeForwards;
  animation.removedOnCompletion = false;
  [self.layer addAnimation:animation forKey:@"colors"];
}

@end

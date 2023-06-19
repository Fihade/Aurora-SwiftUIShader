//
//  Effect.metal
//  Aurora-SwiftUIShader
//
//  Created by fihade on 6/19/23.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 aurora(
     float2 position,
     half4 color,
     float4 box,
     float secs
) {
    vector_float2 p =  (2.0 * position.xy - box.zw) / min(box.z, box.w);
    p *= 2.0;
    for(int i=0;i<10;i++)
    {
        vector_float2 newp= vector_float2(
           p.y+cos(p.x+secs)-sin(p.y*cos(secs*0.8)),
           p.x-sin(p.y-secs)-cos(p.x*sin(secs*0.3))
        );
        p=newp;
    }
    float l = p.y*50.0+500.0+sin(secs*0.8);
    float r=0.0,g=0.0,b=0.0;
         if ((l>=400.0)&&(l<410.0)) { float t=(l-400.0)/(410.0-400.0); r=    +(0.33*t)-(0.20*t*t); }
//    else if ((l>=410.0)&&(l<475.0)) { float t=(l-410.0)/(475.0-410.0); r=0.14         -(0.13*t*t); }
    else if ((l>=545.0)&&(l<595.0)) { float t=(l-545.0)/(595.0-545.0); r=    +(1.98*t)-(     t*t); }
    else if ((l>=595.0)&&(l<650.0)) { float t=(l-595.0)/(650.0-595.0); r=0.98+(0.06*t)-(0.40*t*t); }
    else if ((l>=650.0)&&(l<700.0)) { float t=(l-650.0)/(700.0-650.0); r=0.65-(0.84*t)+(0.20*t*t); }
         if ((l>=415.0)&&(l<475.0)) { float t=(l-415.0)/(475.0-415.0); g=             +(0.80*t*t); }
    else if ((l>=475.0)&&(l<590.0)) { float t=(l-475.0)/(590.0-475.0); g=0.8 +(0.76*t)-(0.80*t*t); }
    else if ((l>=585.0)&&(l<639.0)) { float t=(l-585.0)/(639.0-585.0); g=0.82-(0.80*t)           ; }
         if ((l>=400.0)&&(l<475.0)) { float t=(l-400.0)/(475.0-400.0); b=    +(2.20*t)-(1.50*t*t); }
    else if ((l>=475.0)&&(l<560.0)) { float t=(l-475.0)/(560.0-475.0); b=0.7 -(     t)+(0.30*t*t); }

    return half4(r,g,b, 1.0);
}

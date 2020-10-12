Function SafeColorLimiter(clip clp) {      

    Original = clp.IsY ? "Y" : clp.IsY8 ? "Y8" : clp.IsYV12   ? "YV12"  : clp.IsYUY2  ? "YUY2"
        \ : clp.IsYV16      ? "YV16"  : clp.IsYV24  ? "YV24"
        \ : clp.Is420 ? "YUV420" : clp.IsYV411 ? "YUV411" : clp.Is422 ? "YUV422" : clp.Is444 ? "YUV444"
        \ : ""
        
    Bpc = clp.BitsPerComponent
        
    Assert(Bpc == 8 || Bpc == 10 || Bpc == 12 || Bpc == 14 || Bpc == 16 || Bpc == 32, "Safe Color Limiter: Bit Depth not supported," + Chr(10)+"8bit, 10bit, 12bit, 14bit, 16bit, 32bit planar are supported!")
    
    #Values for 32bit Float
    min_luma_float=16/255.0
    max_luma_float=235/255.0
    min_chroma_float=-112/255.0
    max_chroma_float=107/255.0
    
    Original == "Y8" ? Limiter(clp, min_luma=16, max_luma=235)
    \ : Original == "YUV411" && Bpc == 8 ? Limiter(clp, min_luma=16, max_luma=235, min_chroma=16, max_chroma=240)
    \ : Original == "YV12" ? Limiter(clp, min_luma=16, max_luma=235, min_chroma=16, max_chroma=240)
    \ : Original == "YUV420" && Bpc == 8 ? Limiter(clp, min_luma=16, max_luma=235, min_chroma=16, max_chroma=240)
    \ : Original == "YV16" ? Limiter(clp, min_luma=16, max_luma=235, min_chroma=16, max_chroma=240)
    \ : Original == "YUY2" ? Limiter(clp, min_luma=16, max_luma=235, min_chroma=16, max_chroma=240)
    \ : Original == "YUV422" && Bpc == 8 ? Limiter(clp, min_luma=16, max_luma=235, min_chroma=16, max_chroma=240)
    \ : Original == "YV24" ? Limiter(clp, min_luma=16, max_luma=235, min_chroma=16, max_chroma=240)
    \ : Original == "YUV444" && Bpc == 8 ? Limiter(clp, min_luma=16, max_luma=235, min_chroma=16, max_chroma=240)
    \ : Original == "Y" && Bpc == 10 ? Limiter(clp, min_luma=64, max_luma=940)
    \ : Original == "YUV420" && Bpc == 10 ? Limiter(clp, min_luma=64, max_luma=940, min_chroma=64, max_chroma=940)
    \ : Original == "YUV411" && Bpc == 10 ? Limiter(clp, min_luma=64, max_luma=940, min_chroma=64, max_chroma=940)
    \ : Original == "YUV422" && Bpc == 10 ? Limiter(clp, min_luma=64, max_luma=940, min_chroma=64, max_chroma=940)
    \ : Original == "YUV444" && Bpc == 10 ? Limiter(clp, min_luma=64, max_luma=940, min_chroma=64, max_chroma=940)
    \ : Original == "Y" && Bpc == 12 ? Limiter(clp, min_luma=256, max_luma=3760)
    \ : Original == "YUV420" && Bpc == 12 ? Limiter(clp, min_luma=256, max_luma=3760, min_chroma=256, max_chroma=3760)
    \ : Original == "YUV411" && Bpc == 12 ? Limiter(clp, min_luma=256, max_luma=3760, min_chroma=256, max_chroma=3760)
    \ : Original == "YUV422" && Bpc == 12 ? Limiter(clp, min_luma=256, max_luma=3760, min_chroma=256, max_chroma=3760)
    \ : Original == "YUV444" && Bpc == 12 ? Limiter(clp, min_luma=256, max_luma=3760, min_chroma=256, max_chroma=3760)
    \ : Original == "Y" && Bpc == 14 ? Limiter(clp, min_luma=1024, max_luma=15040)
    \ : Original == "YUV420" && Bpc == 14 ? Limiter(clp, min_luma=1024, max_luma=15040, min_chroma=1024, max_chroma=15040)
    \ : Original == "YUV411" && Bpc == 14 ? Limiter(clp, min_luma=1024, max_luma=15040, min_chroma=1024, max_chroma=15040)
    \ : Original == "YUV422" && Bpc == 14 ? Limiter(clp, min_luma=1024, max_luma=15040, min_chroma=1024, max_chroma=15040)
    \ : Original == "YUV444" && Bpc == 14 ? Limiter(clp, min_luma=1024, max_luma=15040, min_chroma=1024, max_chroma=15040)
    \ : Original == "Y" && Bpc == 16 ? Limiter(clp, min_luma=4096, max_luma=60160)
    \ : Original == "YUV420" && Bpc == 16 ? Limiter(clp, min_luma=4096, max_luma=60160, min_chroma=4096, max_chroma=60160)
    \ : Original == "YUV411" && Bpc == 16 ? Limiter(clp, min_luma=4096, max_luma=60160, min_chroma=4096, max_chroma=60160)
    \ : Original == "YUV422" && Bpc == 16 ? Limiter(clp, min_luma=4096, max_luma=60160, min_chroma=4096, max_chroma=60160)
    \ : Original == "YUV444" && Bpc == 16 ? Limiter(clp, min_luma=4096, max_luma=60160, min_chroma=4096, max_chroma=60160)
    \ : Original == "Y" && Bpc == 32 ? Limiter(clp, min_luma=min_luma_float, max_luma=max_luma_float)
    \ : Original == "YUV420" && Bpc == 32 ? Limiter(clp, min_luma=min_luma_float, max_luma=max_luma_float, min_chroma=min_chroma_float, max_chroma=max_chroma_float)
    \ : Original == "YUV411" && Bpc == 32 ? Limiter(clp, min_luma=min_luma_float, max_luma=max_luma_float, min_chroma=min_chroma_float, max_chroma=max_chroma_float)
    \ : Original == "YUV422" && Bpc == 32 ? Limiter(clp, min_luma=min_luma_float, max_luma=max_luma_float, min_chroma=min_chroma_float, max_chroma=max_chroma_float)
    \ : Original == "YUV444" && Bpc == 32 ? Limiter(clp, min_luma=min_luma_float, max_luma=max_luma_float, min_chroma=min_chroma_float, max_chroma=max_chroma_float)
    \: ""
    
    my_out=last
    my_catched_out=clp
    
    (Original == "Y" || Original == "Y8" || Original == "YUV411" || Original == "YV12" || Original == "YUY2" || Original == "YV16" || Original == "YUV420" || Original == "YUV411" || Original == "YUV422" || Original == "YUV444") ? last : clp

}

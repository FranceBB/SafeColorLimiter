# SafeColorLimiter
The idea is to automatize clipping to get a broadcast safe output in Limited TV Range (0.0-0.7V).
<br>
8bit sources will be limited to 16 - 235 luma and 16 - 240 chroma
<br>
10bit sources will be limited to 64 - 940 luma and 64 - 960 chroma
<br>
12bit sources will be limited to 256 - 3760 luma and 256 - 3840 chroma
<br>
14bit sources will be limited to 1024 - 15040 luma and 1024 - 15360 chroma
<br>
16bit sources will be limited to 4096 - 60160 luma and 4096 - 61440 chroma
<br>
32bit sources will be limited to 16/255.0 - 235/255.0 luma and -112/255.0 - -112/255.0 - 112/255.0 chroma
<br>
<br>
<br>
It supports y8, y10, y12, y14, y16, y32, yv12, YUY2, yv16, yv24 and 
<br>
YUV 4:2:0 planar, YUV 4:1:1 planar, YUV 4:2:2 planar, YUV 4:4:4 planar 10-12-14-16-32bit
<br>
including those with Alpha Channels.
<br>
If the input is in RGB, it will just return the input untouched.
<br>
<br>
Full Range Video:
<img src="https://github.com/dericed/ffmpeg-mpeg2video-clipping/raw/master/sample.gif">
<br>
After Clipping:
<br>
<img src="https://github.com/dericed/ffmpeg-mpeg2video-clipping/raw/master/sample_encoded_as_ffv1.gif">

# LSD-SLAM: Large-Scale Direct Monocular SLAM

LSD-SLAM is a novel approach to real-time monocular SLAM. It is fully direct (i.e. does not use keypoints / features) and creates large-scale, 
semi-dense maps in real-time on a laptop. For more information see
[http://vision.in.tum.de/lsdslam](http://vision.in.tum.de/lsdslam)
where you can also find the corresponding publications and Youtube videos, as well as some 
example-input datasets, and the generated output as rosbag or .ply point cloud.

## How to run

We highly recommend to use docker to build the source, because it is very difficult to reproduce the execution environment on general Linux distributions such as Ubuntu etc.

### Clone the repository 

```
$git clone https://github.com/IshitaTakeshi/lsd_slam_noros.git
$cd lsd_slam_noros
```

### Building a docker image

Run the following command in a directory where `Dockerfile` is placed.

```
$docker build -t lsdslam_noros:latest .
```

### Launch a container

This part is usually environment dependent because we need to share a window with the host.

If you are on Mac, make sure the latest [XQuartz](https://www.xquartz.org) is installed, and run `$./scripts/launch-container-mac.sh`.  
On Linux, run `$./scripts/launch-container-linux.sh`.

### Download the dataset

Download the TUM dataset sequence by running

```
$export SEQUENCE=30  # sequence number of the TUM-mono dataset 
$./scripts/download_tum_mono.sh
```

### Run LSD-SLAM

The debug window should appear by executing `$./bin/main_on_images data/sequence_$SEQUENCE`.

可能遇到

```
(DebugWindow DEPTH:40167): Gtk-WARNING **: 12:15:28.669: gtk_disable_setlocale() must be called before gtk_init()
Segmentation fault (core dumped)
```

解決方法：

1. 多執行幾次（不一定有效）
2. [放開權限，允許本地連接](https://www.lujun9972.win/blog/2018/04/24/docker%E5%AE%B9%E5%99%A8%E4%B8%AD%E8%B7%91gui%E7%9A%84%E6%9C%80%E7%AE%80%E5%8D%95%E6%96%B9%E6%B3%95/)

```
$ xhost +local:
```

## Related Papers

* **LSD-SLAM: Large-Scale Direct Monocular SLAM**, *J. Engel, T. Schöps, D. Cremers*, ECCV '14

* **Semi-Dense Visual Odometry for a Monocular Camera**, *J. Engel, J. Sturm, D. Cremers*, ICCV '13


## License

LSD-SLAM is licensed under the GNU General Public License Version 3 (GPLv3), see http://www.gnu.org/licenses/gpl.html.

For commercial purposes, the original lsd slam authors also offer a professional version under different licencing terms.

import cv2
import os
import imageio

# path = '/data/wudongming/referonline/vis_long_videos/046c247029/0/'
# gif_name = '/data/wudongming/referonline/1.gif'
# frames = []
# pngFiles = os.listdir(path)
# image_list = [os.path.join(path, f) for f in pngFiles if f.endswith('.jpg')]
# for image_name in image_list[:300]:
#     # 读取 png 图像文件
#     frames.append(imageio.v2.imread(image_name))
# # 保存为 gif
# imageio.mimsave(gif_name, frames, fps=5)

img_root = '/data/wudongming/referonline/vis_long_videos/89b01ce6d8/0/'
frames = os.listdir(img_root)
fps = 5
size = (1280, 720)
fourcc = cv2.VideoWriter_fourcc(*'mp4v')
videowriter = cv2.VideoWriter('/data/wudongming/referonline/3.mp4', fourcc, fps, size)
video_len = len(os.listdir(img_root))
for f in frames[0:]:
    frame = cv2.imread(os.path.join(img_root, f))
    cv2.putText(frame, 'Expression: an adult tiger in the middle of two small tigers', (5,50), cv2.FONT_HERSHEY_SIMPLEX, 1, (0,0,255), 2)
    videowriter.write(frame)

videowriter.release()
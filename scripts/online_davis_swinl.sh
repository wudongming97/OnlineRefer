
OUTPUT_DIR=work_dirs/online_davis_swinl

# fine-tuning
#python3 -m torch.distributed.launch --nproc_per_node=8 --master_port=29500 --use_env \
#main.py --with_box_refine --binary --freeze_text_encoder \
#--epochs 1 \
#--num_frames=3 \
#--lr 1e-5 \
#--lr_backbone 1e-6 \
#--sampler_interval=5 \
#--pretrained_weights=output/online_swinl_f2_0.4_sampler1_lrdrop/checkpoint.pth \
#--output_dir=${OUTPUT_DIR} \
#--online \
#--dataset_file davis \
#--use_checkpoint_for_more_frames \
#--backbone swin_l_p4w7

#CHECKPOINT=${OUTPUT_DIR}/checkpoint.pth
CHECKPOINT=/data/wudongming/referonline/output/online_swinl_f2_0.4_sampler1_lrdrop/checkpoint.pth
# inference
python3 inference_davis_online.py --with_box_refine --binary --freeze_text_encoder \
--output_dir=${OUTPUT_DIR} --resume=${CHECKPOINT} \
--dataset_file davis \
--online \
--backbone swin_l_p4w7

# evaluation
ANNO0_DIR=${OUTPUT_DIR}/"valid"/"anno_0"
ANNO1_DIR=${OUTPUT_DIR}/"valid"/"anno_1"
ANNO2_DIR=${OUTPUT_DIR}/"valid"/"anno_2"
ANNO3_DIR=${OUTPUT_DIR}/"valid"/"anno_3"
python3 eval_davis.py --results_path=${ANNO0_DIR}
python3 eval_davis.py --results_path=${ANNO1_DIR}
python3 eval_davis.py --results_path=${ANNO2_DIR}
python3 eval_davis.py --results_path=${ANNO3_DIR}

echo "Working path is: ${OUTPUT_DIR}"
export NGPU=4; CUDA_VISIBLE_DEVICES=0,1,2,3 /home/mansimov/anaconda3/envs/pytorch0.4/bin/python -m torch.distributed.launch --nproc_per_node=$NGPU ../train.py \
  --exp_name nmt_ende_4gpu_8ktokens_labelsmooth0.1 \
  --dump_path /dump/path/ \
  --data_path /data/path/ \
  --lgs 'en-de' \
  --encoder_only false \
  --reload_model "/path/to/XLM/models/mlm_ende_1024.pth,/path/to/XLM/models/mlm_ende_1024.pth" \
  --emb_dim 1024 \
  --n_layers 6 \
  --n_heads 8 \
  --dropout 0.1 \
  --attention_dropout 0.1 \
  --gelu_activation true \
  --tokens_per_batch 2000 \
  --bptt 256 \
  --optimizer adam_inverse_sqrt,beta1=0.9,beta2=0.98,lr=0.0001 \
  --epoch_size 100000 \
  --save_periodic 1 \
  --save_latest_ckpts 10 \
  --label_smoothing 0.1 \
  --eval_bleu true \
  --mt_steps "en-de" \
  --validation_metrics valid_en-de_mt_bleu \
  --stopping_criterion valid_en-de_mt_bleu,10
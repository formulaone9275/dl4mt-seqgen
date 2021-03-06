CUDA_VISIBLE_DEVICES=0 python ../train.py \
  --exp_name eval_ende_nmt_greedy \
  --dump_path /dump/path/ \
  --data_path /data/path/ \
  --lgs 'en-de' \
  --encoder_only false \
  --reload_model "best-valid_en-de_mt_bleu.pth,best-valid_en-de_mt_bleu.pth" \
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
  --eval_only true \
  --beam_size 4 \
  --length_penalty 0.6 \
  --mt_steps "en-de" \
  --validation_metrics valid_en-de_mt_bleu \
  --stopping_criterion valid_en-de_mt_bleu,10

echo "\nPreparing Optical Flow data"
# compute optical flow
python3 rgb_to_opt_flow.py ../data/train.mp4 ../data/flow_train.mp4 --rgb-label-path=../data/train.txt  --flow-label-path=../data/flow_train.txt --optical-flow-algorithm=farneback

python3 rgb_to_opt_flow.py ../data/test.mp4 ../data/flow_test.mp4 --optical-flow-algorithm=farneback


# split train video into train and validation videos
python3 video_train_val_split.py ../data/flow_train.mp4 ../data/flow_train.txt ../data/flow_train_val_split/

# generate train data clips from train split video
python3 gen_train_data.py ../data/flow_train_val_split/train_split_video.mp4 ../data/flow_train_val_split/train_split_label.txt ../data/flow_train_val_split/_train_data_/

# generate train data clips from train split video
python3 gen_val_data.py ../data/flow_train_val_split/validation_split_video.mp4 ../data/flow_train_val_split/validation_split_label.txt ../data/flow_train_val_split/validation_data/

# shuffle train data
echo "\nshuffling training data"
# mix 1
python3 npz_shuffler.py 3 ../data/flow_train_val_split/_train_data_/batch_15.npz ../data/flow_train_val_split/_train_data_/batch_3.npz --npz-file3-path=../data/flow_train_val_split/_train_data_/batch_13.npz --save-dir=../data/flow_train_val_split/train_data/

# mix 2
python3 npz_shuffler.py 3 ../data/flow_train_val_split/_train_data_/batch_21.npz ../data/flow_train_val_split/_train_data_/batch_11.npz --npz-file3-path=../data/flow_train_val_split/_train_data_/batch_1.npz --save-dir=../data/flow_train_val_split/train_data/

# mix 3
python3 npz_shuffler.py 3 ../data/flow_train_val_split/_train_data_/batch_16.npz ../data/flow_train_val_split/_train_data_/batch_5.npz --npz-file3-path=../data/flow_train_val_split/_train_data_/batch_2.npz --save-dir=../data/flow_train_val_split/train_data/

# mix 4
python3 npz_shuffler.py 3 ../data/flow_train_val_split/_train_data_/batch_17.npz ../data/flow_train_val_split/_train_data_/batch_4.npz --npz-file3-path=../data/flow_train_val_split/_train_data_/batch_6.npz --save-dir=../data/flow_train_val_split/train_data/

# mix 5
python3 npz_shuffler.py 3 ../data/flow_train_val_split/_train_data_/batch_18.npz ../data/flow_train_val_split/_train_data_/batch_9.npz --npz-file3-path=../data/flow_train_val_split/_train_data_/batch_7.npz --save-dir=../data/flow_train_val_split/train_data/

# mix 6
python3 npz_shuffler.py 3 ../data/flow_train_val_split/_train_data_/batch_20.npz ../data/flow_train_val_split/_train_data_/batch_10.npz --npz-file3-path=../data/flow_train_val_split/_train_data_/batch_8.npz --save-dir=../data/flow_train_val_split/train_data/

# mix 7
python3 npz_shuffler.py 2 ../data/flow_train_val_split/_train_data_/batch_19.npz ../data/flow_train_val_split/_train_data_/batch_12.npz --save-dir=../data/flow_train_val_split/train_data/

# mix 8 (special mix)
python3 npz_shuffler_special.py ../data/flow_train_val_split/_train_data_/batch_22.npz ../data/flow_train_val_split/_train_data_/batch_14.npz --save-dir=../data/flow_train_val_split/train_data/

python3 cleanup.py ../data/flow_train_val_split/_train_data_/
echo "\nOptical Flow data preparation completed\n"

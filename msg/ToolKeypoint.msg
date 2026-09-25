std_msgs/Header header
string id
string class_name
# Pixel-space 2D coordinates (x, y). z is unused and kept as 0.0.
# If keypoint is unavailable, publisher sets x=y=-1.0.
geometry_msgs/Point tip_2d
geometry_msgs/Point trigger_2d
geometry_msgs/Point handle_2d
float32 confidence

# Every keypoint predicted for this object. The three arrays have the same
# length and order. Names: tip, trigger, handle for all learned tools; a
# hammer drill adds side_handle (the auxiliary grip). Pixel convention is the
# same as the fields above. tip_2d/trigger_2d/handle_2d stay filled for
# backward compatibility.
string[] keypoint_names
geometry_msgs/Point[] keypoints_2d
float32[] keypoint_confidences

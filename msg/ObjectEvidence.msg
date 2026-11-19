# One per-frame observation about one object, answering one question about it
# (e.g. "content" of a bucket, "layout" single/pile of a tile, "section" of a
# steel profile). Emitted by per-frame analyzers and classifiers; fused over
# time by the object reasoner into an ObjectHypothesis.

# Frame and stamp of the source image the evidence was computed from.
std_msgs/Header header

# Stable object id: TIPS "Object_N" when known, else "track_<track_id>".
string object_id

# Detector track id (hri_msgs/Entity.track_id).
uint32 track_id

# Detected (parent) class, e.g. "bucket", "box", "steel_profile", "ceramic_tile".
string parent_class

# Question this evidence answers, e.g. "content", "layout", "section".
string question

# Producer, e.g. "tips_head", "crop_classifier", "pile", "section".
string source

# Candidate answers and p(observation | answer), same order. Not normalised.
string[] hypotheses
float32[] likelihoods

# 0 = useless view for this source, 1 = ideal view. Evidence with a low view
# quality is not fused; only its view_issue is used.
float32 view_quality

# Why the view is not good enough ("" when fine). One of:
# "too_far", "blurred", "truncated", "not_top", "label_hidden", "section_hidden",
# "no_depth", or a source-specific word.
string view_issue

# Optional suggested camera pose (in header.frame_id) that would give a good
# view for this question. Ignored when has_suggested_pose is false.
bool has_suggested_pose
geometry_msgs/Pose suggested_camera_pose

# Source-specific numbers for logs and consumers (JSON object, "" if none).
string payload_json

# One object as the perception stack knows it now, all sources combined (the
# objects counterpart of /humans/unified): who (id), what (class, subclass),
# where (pose, size, grasp / functional points), how sure, and which view is
# missing. All geometry in header.frame_id (the camera optical frame).

std_msgs/Header header

# Stable object id: TIPS "Object_N" when known, else "track_<track_id>".
string id
uint32 track_id

# Detected (parent) class and, when the class has a question, its answer
# ("unknown" until confirmed; "" when the class has no question).
string class_name
string question
string subclass
float32 subclass_confidence
string[] candidate_names
float32[] candidate_probs

# ObjectHypothesis.STATE_* (DETECTED, NEEDS_VIEW, GATHERING, CONFIRMED, LOST).
uint8 state

# Detection confidence of the last frame, 0..1.
float32 detection_score

# Pose: the temporally stable tool pose when available (pose_stable = true),
# else the last per-frame oriented box. size = box size along the pose axes
# (only the visible surface is measured: the size along the view is a lower bound).
bool has_pose
bool pose_stable
geometry_msgs/Pose pose
geometry_msgs/Vector3 size

# 3D functional / grasp points (e.g. tip, trigger, handle; suction points of the
# top piece of a pile), same order in both arrays.
string[] keypoint_names
geometry_msgs/Point[] keypoints

# Missing view (ObjectHypothesis.VIEW_*) and, when known, where the camera
# should be to get it. Data, not a command.
uint8 missing_view
bool has_suggested_pose
geometry_msgs/Pose suggested_camera_pose

float32 seconds_since_seen

# Short factual English text (for logs, RViz and LLM consumers).
string reason

# Extra facts as a JSON object (layers, view angle, stage modes, ...).
string attributes_json

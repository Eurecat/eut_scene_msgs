# What the perception currently knows about one object, built over time from
# per-frame evidence (ObjectEvidence). Data only: the missing view is a fact
# ("a top view is missing"), not a command. Consumers (robot controller, LLM
# planner, scene graph) decide what to do with it.

# State values.
uint8 STATE_DETECTED=0
uint8 STATE_NEEDS_VIEW=1
uint8 STATE_GATHERING=2
uint8 STATE_CONFIRMED=3
uint8 STATE_LOST=4

# Missing view values.
uint8 VIEW_NONE=0
uint8 VIEW_MOVE_CLOSER=1
uint8 VIEW_FROM_TOP=2
uint8 VIEW_END_ON=3
uint8 VIEW_CENTER_OBJECT=4
uint8 VIEW_HOLD_STILL=5

# Camera frame (camera_color_optical_frame) and stamp of the last update.
std_msgs/Header header

# Stable object id: TIPS "Object_N" when known, else "track_<track_id>".
string id
uint32 track_id

# Detected (parent) class, e.g. "bucket".
string parent_class

# Question answered for this class ("" when the class has no question) and the
# answer: "unknown" until confirmed, then one of candidate_names.
string question
string subclass
float32 subclass_confidence
string[] candidate_names
float32[] candidate_probs

uint8 state

# Number of evidence messages fused so far, and seconds since the object was
# last observed.
uint32 evidence_count
float32 seconds_since_seen

# Missing view (VIEW_NONE when nothing is missing) and, when known, a suggested
# camera pose in header.frame_id that would give it.
uint8 missing_view
bool has_suggested_pose
geometry_msgs/Pose suggested_camera_pose
float32 target_distance_m

# Short factual English text for logs, RViz and LLM consumers.
string reason

# Last known object pose in header.frame_id (identity when unknown).
bool has_pose
geometry_msgs/Pose pose

# Extra facts as a JSON object, e.g. {"layers": 7, "stage_modes": {...}}.
string attributes_json

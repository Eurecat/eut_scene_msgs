std_msgs/Header header
string id
string class_name
geometry_msgs/Pose pose
float32 confidence

# Overall final reliability score (0..1). For a raw single-frame estimate this
# is the geometric/keypoint quality only; for a stabilized estimate it also
# reflects temporal agreement.

# Source of this estimate. One of:
#   "learned_3d"          - raw per-frame learned functional-point orientation
#   "geometry_3d"         - raw per-frame 3D segmentation-cloud geometry
#   "learned_3d_stable"   - temporally stabilized learned-orientation output
#   "geometry_3d_stable"  - temporally stabilized geometry output
string estimation_source

# True only on the final stabilized /obj_pose/tool_pose_6d topic once the
# per-object temporal filter has passed warm-up. Always false on the raw and
# geometry topics.
bool stable

# Number of per-frame observations currently held in the temporal window for
# this object (0 on raw/geometry-only messages).
uint32 sample_count

# Number of recent observations that passed the temporal outlier gate.
uint32 inlier_count

# Rolling standard deviation of accepted positions, in meters.
# Sentinel -1.0 when unavailable (e.g. raw per-frame estimate, insufficient
# history). Do not interpret -1.0 as zero variance.
float32 position_std_m

# Rolling standard deviation of accepted orientations, in degrees.
# Sentinel -1.0 when unavailable, same convention as position_std_m.
float32 orientation_std_deg

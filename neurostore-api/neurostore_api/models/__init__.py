# flake8: noqa

# import all models into this package
# if you have many models here with many references from one model to another this may
# raise a RecursionError
# to avoid this, import only the models that you directly need like:
# from from neurostore_api.model.pet import Pet
# or import this package, but before doing it, use:
# import sys
# sys.setrecursionlimit(n)

from neurostore_api.model.analysis import Analysis
from neurostore_api.model.analysis_list import AnalysisList
from neurostore_api.model.analysis_return import AnalysisReturn
from neurostore_api.model.annotation import Annotation
from neurostore_api.model.annotation_export import AnnotationExport
from neurostore_api.model.annotation_list import AnnotationList
from neurostore_api.model.annotation_note import AnnotationNote
from neurostore_api.model.annotation_return import AnnotationReturn
from neurostore_api.model.condition import Condition
from neurostore_api.model.condition_list import ConditionList
from neurostore_api.model.condition_return import ConditionReturn
from neurostore_api.model.dataset import Dataset
from neurostore_api.model.dataset_list import DatasetList
from neurostore_api.model.dataset_return import DatasetReturn
from neurostore_api.model.image import Image
from neurostore_api.model.image_list import ImageList
from neurostore_api.model.image_return import ImageReturn
from neurostore_api.model.inline_response404 import InlineResponse404
from neurostore_api.model.inline_response422 import InlineResponse422
from neurostore_api.model.json_ld import JsonLd
from neurostore_api.model.json_ld_context import JsonLdContext
from neurostore_api.model.metadata import Metadata
from neurostore_api.model.point import Point
from neurostore_api.model.point_list import PointList
from neurostore_api.model.point_return import PointReturn
from neurostore_api.model.point_value import PointValue
from neurostore_api.model.read_only import ReadOnly
from neurostore_api.model.study import Study
from neurostore_api.model.study_list import StudyList
from neurostore_api.model.study_return import StudyReturn
from neurostore_api.model.user import User
from neurostore_api.model.user_list import UserList

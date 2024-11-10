import lexical_analysis.pretty_printing as prpr
from launching import define_args
from shutil import rmtree
from clone_detection.algorithm import CCalignerAlgorithm
import os

args = define_args()

codebase_loc = args.codebase_loc
language = args.lang
if language == 'python':
    lang_ext = '.py'
elif language == 'java':
    lang_ext = '.java'


pretty_loc = "./normalized_codebases/"
if os.path.exists(pretty_loc):
    print("pretty loc exists and was deleted")
    rmtree(pretty_loc)


pp = prpr.PrettyPrinter(codebase_loc, pretty_loc, language)
pp.pretty_print()

final_dir = pretty_loc + codebase_loc.split('/')[-1] + '/' + 'obfuscated'
print(fr"final_dir = {final_dir}")

cca = CCalignerAlgorithm(final_dir, lang_ext, 3, 0)
pairs = cca.run_algo()
print(fr"pairs = {pairs}")
for file1, file2 in pairs:
    file_name1 = file1.split('/')[-2]
    file_name2 = file2.split('/')[-2]
    fragment1 = file1.split('/')[-1][:-3]
    fragment2 = file2.split('/')[-1][:-3]
    print(f"{file_name1} and {file_name2} contain codeclone in lines {fragment1} and {fragment2} respectively")
{
  buildNpmPackage,
  fetchFromGitHub,
  lib,
}:

buildNpmPackage rec {
  pname = "promptfoo";
  version = "0.115.4";

  src = fetchFromGitHub {
    owner = "promptfoo";
    repo = "promptfoo";
    rev = "${version}";
    hash = "sha256-5PKNc44ke8VqRCZqaCHcAnAgmjFnYjCWtAAeZsMcwiU=";
  };

  npmDepsHash = "sha256-ZYQV/l6uKyY5Jdkp73D9V1Ht7eEWescyInMDIYV54VA=";

  dontNpmBuild = true;

  meta = {
    description = "Test your prompts, models, RAGs. Evaluate and compare LLM outputs, catch regressions, and improve prompt quality";
    mainProgram = "promptfoo";
    homepage = "https://www.promptfoo.dev/";
    changelog = "https://github.com/promptfoo/promptfoo/releases/tag/${version}";
    license = lib.licenses.mit;
    maintainers = [ lib.maintainers.nathanielbrough ];
  };
}

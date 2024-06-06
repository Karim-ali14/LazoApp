import 'package:openapi_generator_annotations/openapi_generator_annotations.dart';
//Generate : flutter pub run build_runner build --delete-conflicting-outputs
@Openapi(
    additionalProperties:
    AdditionalProperties(pubName: 'athletix', pubAuthor: 'zimozi'),
    inputSpecFile: '../LazoProvider/assets/lazo.yaml',
    generatorName: Generator.dart,
    alwaysRun: true,
    skipSpecValidation: true,
    outputDirectory: '../LazoProvider/lib/Data/Network')
class Example extends OpenapiGeneratorConfig {}
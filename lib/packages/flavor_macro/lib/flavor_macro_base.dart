import 'dart:async';

import 'package:antinna/packages/macros/lib/macros.dart';
import 'package:flutter/services.dart' show appFlavor;

macro class FlavorMaco implements 
// ClassDefinitionMacro,
ClassDeclarationsMacro  {

  const FlavorMaco();
  

  @override
  FutureOr<void> buildDeclarationsForClass(ClassDeclaration clazz, MemberDeclarationBuilder builder)async  {
  Identifier flavorConfig;
 if (appFlavor =="dev"){
 flavorConfig = await  builder.resolveIdentifier(Uri.parse('package:antinna/packages/flavor_macro/lib/config_dev.dart'), 'config');
 }
 else if(appFlavor =="stage"){
 flavorConfig = await  builder.resolveIdentifier(Uri.parse('package:antinna/packages/flavor_macro/lib/config_stage.dart'), 'config');

 }else{
 flavorConfig = await  builder.resolveIdentifier(Uri.parse('package:antinna/packages/flavor_macro/lib/config_prod.dart'), 'config');

 }

 builder.declareInType(DeclarationCode.fromParts(['external String? appFlavor = $appFlavor;\n',
 'external final  config = $flavorConfig'
 
 ]));
    
  }
  
 
  

  

  


}
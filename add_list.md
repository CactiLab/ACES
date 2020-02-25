# Additions for LLVM

> This file is to show the additional code of ACES for LLVM

## Head files

- New folder created in `include/json`
```c
json-forwards.h
InitializaPasses.h
json.h
```

- include/llvm/LinkAllPasses.h line 64:
```c
(void) llvm::createHexboxAnalysisPass();
(void) llvm::createHexboxApplicationPass();
(void) llvm::createExperimentAnalysisPass();
```

- include/llvm/Transforms/Instrumentation.h line 80:
```c
FunctionPass * createHexboxAnalysisPass();
ModulePass * createHexboxApplicationPass();
FunctionPass * createExperimentAnalysisPass();
```

- include/llvm/IR/Function.h line 137: 
```c
void setIsHexboxEntry(bool V);
bool getIsHexboxEntry();
```

## Libraries

- lib/CodeGen
```c
Same??
```
- lib/IR line 281:
```c
//isHexboxEntry = false;
```
- lib/LTOCodeGnerator.cpp line146:
```c
initializeHexboxAnalysisPass(R);
initializeHexboxApplicationPass(R);
initializeExperimentAnalysisPass(R);
```
### Support
new file to lib/Support/jsoncpp.cpp
-lib/Support/CMakeLists.txt line 131:
```c 
jsoncpp.cpp
```

### Transforms/Utils
new file to 
```
lib/Transforms/Utils/HexboxApplication.cpp, lib/Transforms/Utils/HexboxAnalysis.cpp, lib/Transforms/Utils/ExperimentAnalysis.cpp
```

lib/Transform/Utils/CMakeLists.txt line 56:
```c
HexboxAnalysis.cpp
HexboxApplication.cpp
ExperimentAnalysis.cpp
```
lib/Transform/Utils/Utils.cpp line 44:
```c
initializeHexboxAnalysisPass(Registry);
initializeHexboxApplicationPass(Registry);
initializeExperimentAnalysisPass(Registry);
```

### Transforms/IPO
PassManagerBuilder.cpp line 868:
```c
PM.add(createHexboxAnalysisPass());
PM.add(createHexboxApplicationPass());
PM.add(createExperimentAnalysisPass());
```

### Analysis/
CMakeLists.txt nothing

## Target/ARM/
ARMInstrThumb.td 
```c
line 490
def HEXBOX_tBL  : tPseudoInst<(outs), (ins pred:$p, thumb_bl_target:$func, 
	   i32imm:$md), 12, IIC_Br,
                [(ARMHexbox_Entry tglobaladdr:$func, tglobaladdr:$md)]>,
           Requires<[IsThumb]>, Sched<[WriteBrL]> {
}
 
line 535
def HEXBOX_tBLXr : tPseudoInst<(outs), (ins pred:$p, GPR:$func, 
	     i32imm:$md ),12, IIC_Br,
          [(ARMHexbox_Entry GPR:$func, tglobaladdr:$md)]>,
      Requires<[IsThumb]>,Sched<[WriteBrL]> { 

}

line 841
let Inst{7-0} = regs{7-0};
}

let mayLoad = 1, Uses = [SP], Defs = [SP], hasExtraDefRegAllocReq = 1 in
def tPOP_LR : T1I<(outs), (ins pred:$p, reglist:$regs, variable_ops),
             IIC_iPop,
             "pop${p}\t$regs", []>,
         T1Misc<{1,1,0,?,?,?,?}> {
bits<16> regs;
let Inst{9}   = regs{14};
```

ARMInstrInfo.td 
```c
line 30:
def SDT_ARMHexbox_Entry    : SDTypeProfile<0, -1, [SDTCisPtrTy<0>, SDTCisPtrTy<1>] >;

line 116:
def ARMHexbox_Entry  : SDNode<"ARMISD::HEXBOX_Entry", SDT_ARMHexbox_Entry,
                              [SDNPHasChain, SDNPOptInGlue, SDNPOutGlue,
                               SDNPVariadic]>;

```

ARMISelLowering.cpp
```c 
  case ARMISD::HEXBOX_Entry:  return "ARMISD::HEXBOX_Entry";

line 2049
  GlobalValue *Call_Metadata = nullptr;
  if(CallOpc == ARMISD::CALL){
      if(CLI.CS){
        if (const CallInst *ci = dyn_cast<CallInst>(CLI.CS->getInstruction())){
          //errs()<<"Checking for metadata\n";
          Call_Metadata = ci->getHexboxMetadata();
          if (Call_Metadata){
              DEBUG(errs() << "Replacing Call with Hexbox_Entry\n");
              DEBUG(errs() << "Function: ");
              DEBUG(errs().write_escaped(ci->getParent()->getParent()->getName()) <<"\n");
              DEBUG(ci->dump());

              CallOpc = ARMISD::HEXBOX_Entry;
          }
        }
      }
  }
line 2057
  //Added to test Getting Hexbox_Entry added
  if (Call_Metadata){
    Ops.push_back(DAG.getTargetGlobalAddress(Call_Metadata,dl,PtrVt));
     }
line 2096

  //CLI.CS->getInstruction()->dump();
2070a2098
  //Chain.dump();
2071a2100
  // TODO:: I think I can add new inst here to do my stuff
2698a2728
  assert(true && "ARMISD::CALL not evaluated to see if needs Hexbox");
```
ARMISelLowering.h 
54c54
```c
HEXBOX_Entry,  // Hexbox Compartment entry
```

ARM.h 
```c
```FunctionPass *createMCExperimentPrinterPass();
```
ARMTargetMachine.cpp 
```c
  //addPass(createMCExperimentPrinterPass());
  //addPass(createMCExperimentPrinterPass());
  //addPass(createMCExperimentPrinterPass());
  addPass(createMCExperimentPrinterPass());
```

new file: **MCExperimentPrinter.cpp**

lib-Target-Arm-CMakeLists.txt 
```c
  MCExperimentPrinter.cpp
```

## New files

### JSON
json-forwards.h
InitializaPasses.h
json.h
jsoncpp.cpp

### Hexbox
lib/Transforms/Utils/HexboxApplication.cpp, 
lib/Transforms/Utils/HexboxAnalysis.cpp, 
lib/Transforms/Utils/ExperimentAnalysis.cpp

### Backend
MCExperimentPrinter.cpp
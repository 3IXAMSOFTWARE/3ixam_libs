/*===------- llvm/Config/llvm-config.h - llvm configuration -------*- C -*-===*/
/*                                                                            */
/* Part of the LLVM Project, under the Apache License v2.0 with LLVM          */
/* Exceptions.                                                                */
/* See https://llvm.org/LICENSE.txt for license information.                  */
/* SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception                    */
/*                                                                            */
/*===----------------------------------------------------------------------===*/

/* This file enumerates variables from the LLVM configuration so that they
   can be in exported headers and won't override package specific directives.
   This is a C header that can be included in the llvm-c headers. */

#ifndef LLVM_CONFIG_H
#define LLVM_CONFIG_H

/* Define if LLVM_ENABLE_DUMP is enabled */
/* #undef LLVM_ENABLE_DUMP */

/* Target triple LLVM will generate code for by default */
#define LLVM_DEFAULT_TARGET_TRIPLE "arm64-apple-darwin21.6.0"

/* Define if threads enabled */
#define LLVM_ENABLE_THREADS 1

/* Has gcc/MSVC atomic intrinsics */
#define LLVM_HAS_ATOMICS 1

/* Host triple LLVM will be executed on */
#define LLVM_HOST_TRIPLE "arm64-apple-darwin21.6.0"

/* LLVM architecture name for the native architecture, if available */
#define LLVM_NATIVE_ARCH AArch64

/* LLVM name for the native AsmParser init function, if available */
#define LLVM_NATIVE_ASMPARSER LLVMInitializeAArch64AsmParser

/* LLVM name for the native AsmPrinter init function, if available */
#define LLVM_NATIVE_ASMPRINTER LLVMInitializeAArch64AsmPrinter

/* LLVM name for the native Disassembler init function, if available */
#define LLVM_NATIVE_DISASSEMBLER LLVMInitializeAArch64Disassembler

/* LLVM name for the native Target init function, if available */
#define LLVM_NATIVE_TARGET LLVMInitializeAArch64Target

/* LLVM name for the native TargetInfo init function, if available */
#define LLVM_NATIVE_TARGETINFO LLVMInitializeAArch64TargetInfo

/* LLVM name for the native target MC init function, if available */
#define LLVM_NATIVE_TARGETMC LLVMInitializeAArch64TargetMC

/* Define if this is Unixish platform */
#define LLVM_ON_UNIX 1

/* Define if we have the Intel JIT API runtime support library */
#define LLVM_USE_INTEL_JITEVENTS 0

/* Define if we have the oprofile JIT-support library */
#define LLVM_USE_OPROFILE 0

/* Define if we have the perf JIT-support library */
#define LLVM_USE_PERF 0

/* Major version of the LLVM API */
#define LLVM_VERSION_MAJOR 12

/* Minor version of the LLVM API */
#define LLVM_VERSION_MINOR 0

/* Patch version of the LLVM API */
#define LLVM_VERSION_PATCH 0

/* LLVM version string */
#define LLVM_VERSION_STRING "12.0.0"

/* Whether LLVM records statistics for use with GetStatistics(),
 * PrintStatistics() or PrintStatisticsJSON()
 */
#define LLVM_FORCE_ENABLE_STATS 0

/* Define if we have z3 and want to build it */
/* #undef LLVM_WITH_Z3 */

/* Define if LLVM was built with a dependency to the libtensorflow dynamic library */
/* #undef LLVM_HAVE_TF_API */

/* Define if LLVM was built with a dependency to the tensorflow compiler */
/* #undef LLVM_HAVE_TF_AOT */

/* Define to 1 if you have the <sysexits.h> header file. */
#define HAVE_SYSEXITS_H 1

/* Define to 1 to enable the experimental new pass manager by default */
#define LLVM_ENABLE_NEW_PASS_MANAGER 0

#endif
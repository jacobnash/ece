#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=mkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Snake.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Snake.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=config.S Main.S Print_Time_String.S UART_SETUP.S Clear_Screen.S Read_Time.S Verify_Read.S Print_Time.S Print_Board.S

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/config.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/Print_Time_String.o ${OBJECTDIR}/UART_SETUP.o ${OBJECTDIR}/Clear_Screen.o ${OBJECTDIR}/Read_Time.o ${OBJECTDIR}/Verify_Read.o ${OBJECTDIR}/Print_Time.o ${OBJECTDIR}/Print_Board.o
POSSIBLE_DEPFILES=${OBJECTDIR}/config.o.d ${OBJECTDIR}/Main.o.d ${OBJECTDIR}/Print_Time_String.o.d ${OBJECTDIR}/UART_SETUP.o.d ${OBJECTDIR}/Clear_Screen.o.d ${OBJECTDIR}/Read_Time.o.d ${OBJECTDIR}/Verify_Read.o.d ${OBJECTDIR}/Print_Time.o.d ${OBJECTDIR}/Print_Board.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/config.o ${OBJECTDIR}/Main.o ${OBJECTDIR}/Print_Time_String.o ${OBJECTDIR}/UART_SETUP.o ${OBJECTDIR}/Clear_Screen.o ${OBJECTDIR}/Read_Time.o ${OBJECTDIR}/Verify_Read.o ${OBJECTDIR}/Print_Time.o ${OBJECTDIR}/Print_Board.o

# Source Files
SOURCEFILES=config.S Main.S Print_Time_String.S UART_SETUP.S Clear_Screen.S Read_Time.S Verify_Read.S Print_Time.S Print_Board.S


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Snake.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX460F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/config.o: config.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${RM} ${OBJECTDIR}/config.o.ok ${OBJECTDIR}/config.o.err 
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" "${OBJECTDIR}/config.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/config.o.d"  -o ${OBJECTDIR}/config.o config.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/config.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
${OBJECTDIR}/Main.o: Main.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	@${RM} ${OBJECTDIR}/Main.o.ok ${OBJECTDIR}/Main.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" "${OBJECTDIR}/Main.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Main.o.d"  -o ${OBJECTDIR}/Main.o Main.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Main.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
${OBJECTDIR}/Print_Time_String.o: Print_Time_String.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Print_Time_String.o.d 
	@${RM} ${OBJECTDIR}/Print_Time_String.o 
	@${RM} ${OBJECTDIR}/Print_Time_String.o.ok ${OBJECTDIR}/Print_Time_String.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Print_Time_String.o.d" "${OBJECTDIR}/Print_Time_String.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Print_Time_String.o.d"  -o ${OBJECTDIR}/Print_Time_String.o Print_Time_String.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Print_Time_String.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
${OBJECTDIR}/UART_SETUP.o: UART_SETUP.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART_SETUP.o.d 
	@${RM} ${OBJECTDIR}/UART_SETUP.o 
	@${RM} ${OBJECTDIR}/UART_SETUP.o.ok ${OBJECTDIR}/UART_SETUP.o.err 
	@${FIXDEPS} "${OBJECTDIR}/UART_SETUP.o.d" "${OBJECTDIR}/UART_SETUP.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/UART_SETUP.o.d"  -o ${OBJECTDIR}/UART_SETUP.o UART_SETUP.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/UART_SETUP.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
${OBJECTDIR}/Clear_Screen.o: Clear_Screen.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Clear_Screen.o.d 
	@${RM} ${OBJECTDIR}/Clear_Screen.o 
	@${RM} ${OBJECTDIR}/Clear_Screen.o.ok ${OBJECTDIR}/Clear_Screen.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Clear_Screen.o.d" "${OBJECTDIR}/Clear_Screen.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Clear_Screen.o.d"  -o ${OBJECTDIR}/Clear_Screen.o Clear_Screen.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Clear_Screen.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
${OBJECTDIR}/Read_Time.o: Read_Time.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Read_Time.o.d 
	@${RM} ${OBJECTDIR}/Read_Time.o 
	@${RM} ${OBJECTDIR}/Read_Time.o.ok ${OBJECTDIR}/Read_Time.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Read_Time.o.d" "${OBJECTDIR}/Read_Time.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Read_Time.o.d"  -o ${OBJECTDIR}/Read_Time.o Read_Time.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Read_Time.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
${OBJECTDIR}/Verify_Read.o: Verify_Read.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Verify_Read.o.d 
	@${RM} ${OBJECTDIR}/Verify_Read.o 
	@${RM} ${OBJECTDIR}/Verify_Read.o.ok ${OBJECTDIR}/Verify_Read.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Verify_Read.o.d" "${OBJECTDIR}/Verify_Read.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Verify_Read.o.d"  -o ${OBJECTDIR}/Verify_Read.o Verify_Read.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Verify_Read.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
${OBJECTDIR}/Print_Time.o: Print_Time.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Print_Time.o.d 
	@${RM} ${OBJECTDIR}/Print_Time.o 
	@${RM} ${OBJECTDIR}/Print_Time.o.ok ${OBJECTDIR}/Print_Time.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Print_Time.o.d" "${OBJECTDIR}/Print_Time.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Print_Time.o.d"  -o ${OBJECTDIR}/Print_Time.o Print_Time.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Print_Time.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
${OBJECTDIR}/Print_Board.o: Print_Board.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Print_Board.o.d 
	@${RM} ${OBJECTDIR}/Print_Board.o 
	@${RM} ${OBJECTDIR}/Print_Board.o.ok ${OBJECTDIR}/Print_Board.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Print_Board.o.d" "${OBJECTDIR}/Print_Board.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Print_Board.o.d"  -o ${OBJECTDIR}/Print_Board.o Print_Board.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Print_Board.o.asm.d",--defsym=__ICD2RAM=1,--defsym=__MPLAB_DEBUG=1,--gdwarf-2,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
	
else
${OBJECTDIR}/config.o: config.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/config.o.d 
	@${RM} ${OBJECTDIR}/config.o 
	@${RM} ${OBJECTDIR}/config.o.ok ${OBJECTDIR}/config.o.err 
	@${FIXDEPS} "${OBJECTDIR}/config.o.d" "${OBJECTDIR}/config.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/config.o.d"  -o ${OBJECTDIR}/config.o config.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/config.o.asm.d",--gdwarf-2
	
${OBJECTDIR}/Main.o: Main.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Main.o.d 
	@${RM} ${OBJECTDIR}/Main.o 
	@${RM} ${OBJECTDIR}/Main.o.ok ${OBJECTDIR}/Main.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Main.o.d" "${OBJECTDIR}/Main.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Main.o.d"  -o ${OBJECTDIR}/Main.o Main.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Main.o.asm.d",--gdwarf-2
	
${OBJECTDIR}/Print_Time_String.o: Print_Time_String.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Print_Time_String.o.d 
	@${RM} ${OBJECTDIR}/Print_Time_String.o 
	@${RM} ${OBJECTDIR}/Print_Time_String.o.ok ${OBJECTDIR}/Print_Time_String.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Print_Time_String.o.d" "${OBJECTDIR}/Print_Time_String.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Print_Time_String.o.d"  -o ${OBJECTDIR}/Print_Time_String.o Print_Time_String.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Print_Time_String.o.asm.d",--gdwarf-2
	
${OBJECTDIR}/UART_SETUP.o: UART_SETUP.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/UART_SETUP.o.d 
	@${RM} ${OBJECTDIR}/UART_SETUP.o 
	@${RM} ${OBJECTDIR}/UART_SETUP.o.ok ${OBJECTDIR}/UART_SETUP.o.err 
	@${FIXDEPS} "${OBJECTDIR}/UART_SETUP.o.d" "${OBJECTDIR}/UART_SETUP.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/UART_SETUP.o.d"  -o ${OBJECTDIR}/UART_SETUP.o UART_SETUP.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/UART_SETUP.o.asm.d",--gdwarf-2
	
${OBJECTDIR}/Clear_Screen.o: Clear_Screen.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Clear_Screen.o.d 
	@${RM} ${OBJECTDIR}/Clear_Screen.o 
	@${RM} ${OBJECTDIR}/Clear_Screen.o.ok ${OBJECTDIR}/Clear_Screen.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Clear_Screen.o.d" "${OBJECTDIR}/Clear_Screen.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Clear_Screen.o.d"  -o ${OBJECTDIR}/Clear_Screen.o Clear_Screen.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Clear_Screen.o.asm.d",--gdwarf-2
	
${OBJECTDIR}/Read_Time.o: Read_Time.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Read_Time.o.d 
	@${RM} ${OBJECTDIR}/Read_Time.o 
	@${RM} ${OBJECTDIR}/Read_Time.o.ok ${OBJECTDIR}/Read_Time.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Read_Time.o.d" "${OBJECTDIR}/Read_Time.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Read_Time.o.d"  -o ${OBJECTDIR}/Read_Time.o Read_Time.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Read_Time.o.asm.d",--gdwarf-2
	
${OBJECTDIR}/Verify_Read.o: Verify_Read.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Verify_Read.o.d 
	@${RM} ${OBJECTDIR}/Verify_Read.o 
	@${RM} ${OBJECTDIR}/Verify_Read.o.ok ${OBJECTDIR}/Verify_Read.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Verify_Read.o.d" "${OBJECTDIR}/Verify_Read.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Verify_Read.o.d"  -o ${OBJECTDIR}/Verify_Read.o Verify_Read.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Verify_Read.o.asm.d",--gdwarf-2
	
${OBJECTDIR}/Print_Time.o: Print_Time.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Print_Time.o.d 
	@${RM} ${OBJECTDIR}/Print_Time.o 
	@${RM} ${OBJECTDIR}/Print_Time.o.ok ${OBJECTDIR}/Print_Time.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Print_Time.o.d" "${OBJECTDIR}/Print_Time.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Print_Time.o.d"  -o ${OBJECTDIR}/Print_Time.o Print_Time.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Print_Time.o.asm.d",--gdwarf-2
	
${OBJECTDIR}/Print_Board.o: Print_Board.S  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/Print_Board.o.d 
	@${RM} ${OBJECTDIR}/Print_Board.o 
	@${RM} ${OBJECTDIR}/Print_Board.o.ok ${OBJECTDIR}/Print_Board.o.err 
	@${FIXDEPS} "${OBJECTDIR}/Print_Board.o.d" "${OBJECTDIR}/Print_Board.o.asm.d" -t $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC} $(MP_EXTRA_AS_PRE)  -c -mprocessor=$(MP_PROCESSOR_OPTION)  -MMD -MF "${OBJECTDIR}/Print_Board.o.d"  -o ${OBJECTDIR}/Print_Board.o Print_Board.S  -Wa,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_AS_POST),-MD="${OBJECTDIR}/Print_Board.o.asm.d",--gdwarf-2
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Snake.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PK3=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Snake.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}           -mreserve=data@0x0:0x1FC -mreserve=boot@0x1FC02000:0x1FC02FEF -mreserve=boot@0x1FC02000:0x1FC024FF  -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Snake.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Snake.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}/xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Snake.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell "${PATH_TO_IDE_BIN}"mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif

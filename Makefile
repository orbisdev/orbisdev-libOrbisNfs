ifndef ORBISDEV
$(error ORBISDEV, is not set)
endif

target := ps4_lib
OutPath := lib
TargetFile := liborbisNfs
AllTarget = $(OutPath)/$(TargetFile).a 

include $(ORBISDEV)/make/ps4sdklib.mk
CompilerFlags += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D_BSD_SOURCE 
CompilerFlagsCpp += -DHAVE_CONFIG_H -D_U_="__attribute__((unused))" -DNDEBUG -D_BSD_SOURCE 
IncludePath += -Iinclude/nfsc 


$(OutPath)/$(TargetFile).a: $(ObjectFiles)
	$(dirp)
	$(archive)

install:
	@cp $(OutPath)/$(TargetFile).a $(ORBISDEV)/usr/lib
	@mkdir -p $(ORBISDEV)/usr/include/orbis/nfsc
	@cp include/nfsc/*.h $(ORBISDEV)/usr/include/orbis/nfsc	
	@cp include/orbisNfs.h $(ORBISDEV)/usr/include/orbis
	@echo "$(TargetFile) Installed!"


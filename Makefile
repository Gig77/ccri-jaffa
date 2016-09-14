export SHELLOPTS:=errexit:pipefail
SHELL=/bin/bash  # required to make pipefail work
.SECONDARY:      # do not delete any intermediate files
LOG = perl -ne 'use POSIX qw(strftime); $$|=1; print strftime("%F %02H:%02M:%S ", localtime), $$ARGV[0], "$@: $$_";'

PROJECT_HOME=/mnt/projects/jaffa
DOCKER=docker run -it --rm --net=host -e DOCKER_UID=$$(id -u) -e DOCKER_UNAME=$$(id -un) -e DOCKER_GID=$$(id -g) -e DOCKER_GNAME=$$(id -gn) -e DOCKER_HOME=$$HOME -v /home:/home -v /data_synology:/data_synology -v /data:/data -v /data2:/data2 -v /data_synology/christian/jaffa/results/current:$(PROJECT_HOME)/results -v /data_synology/christian/jaffa/data:$(PROJECT_HOME)/data:ro -w $$(pwd)
JAFFA=$(DOCKER) -v /data_synology/christian/jaffa/scripts/src/JAFFA_stages.groovy:/usr/local/JAFFA-version-1.06/JAFFA_stages.groovy -v /data_synology/christian/jaffa/scripts/src/JAFFA_assembly.groovy:/usr/local/JAFFA-version-1.06/JAFFA_assembly.groovy biowaste:5000/ccri/jaffa-1.06 /usr/local/JAFFA-version-1.06/tools/bin/bpipe run -y

MAX_EWING = /mnt/projects/jaffa/data/32317_GAGTGG_C81YNANXX_1_20151113B_20151113.bam \
			/mnt/projects/jaffa/data/32325_ACTTGA_C80UEANXX_2_20151106B_20151106.bam
			
FIONA_NALM6_1ST_BATCH = /home/cf/fiona/data/bam/32232_CGATGT_C80BJANXX_3_20150925B_20150925.bam \
				  		/home/cf/fiona/data/bam/32233_TGACCA_C80BJANXX_3_20150925B_20150925.bam \
				  		/home/cf/fiona/data/bam/32234_ACAGTG_C80BJANXX_3_20150925B_20150925.bam \
				  		/home/cf/fiona/data/bam/32235_GCCAAT_C80BJANXX_3_20150925B_20150925.bam \
				  		/home/cf/fiona/data/bam/32236_CAGATC_C80BJANXX_3_20150925B_20150925.bam \
				  		/home/cf/fiona/data/bam/32237_CTTGTA_C80BJANXX_3_20150925B_20150925.bam

FIONA_NALM6_2ND_BATCH = /home/cf/fiona/data/bam/35109_CGATGT_C8918ANXX_8_20151231B_20151231.bam \
				  		/home/cf/fiona/data/bam/35110_TGACCA_C8918ANXX_8_20151231B_20151231.bam \
				  		/home/cf/fiona/data/bam/35111_ACAGTG_C8918ANXX_8_20151231B_20151231.bam \
				  		/home/cf/fiona/data/bam/35112_GCCAAT_C8918ANXX_8_20151231B_20151231.bam \
				  		/home/cf/fiona/data/bam/35113_CAGATC_C8918ANXX_8_20151231B_20151231.bam \
				  		/home/cf/fiona/data/bam/35114_CTTGTA_C8918ANXX_8_20151231B_20151231.bam

OSKAR_IAMP21 = /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A1_14s006561-1-1_Vesely_lane114s006561_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A2_14s006562-1-1_Vesely_lane114s006562_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A3_14s006563-1-1_Vesely_lane114s006563_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A4_14s006564-1-1_Vesely_lane114s006564_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A5_14s006565-1-1_Vesely_lane114s006565_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A7_14s006566-1-1_Vesely_lane114s006566_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A8_14s006567-1-1_Vesely_lane114s006567_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A9_14s006568-1-1_Vesely_lane214s006568_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A10_14s006569-1-1_Vesely_lane214s006569_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A11_14s006570-1-1_Vesely_lane214s006570_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A12_14s006571-1-1_Vesely_lane214s006571_sequence.bam \
			   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_A13_14s006572-1-1_Vesely_lane214s006572_sequence.bam

OSKAR_ER = /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C1_14s006573-1-1_Vesely_lane214s006573_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C2_14s006574-1-1_Vesely_lane214s006574_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C3_14s006575-1-1_Vesely_lane314s006575_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C4_14s006576-1-1_Vesely_lane414s006576_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C5_14s006577-1-1_Vesely_lane414s006577_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C6_14s006578-1-1_Vesely_lane414s006578_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C7_14s006579-1-1_Vesely_lane314s006579_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C8_14s006580-1-1_Vesely_lane414s006580_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C9_14s006581-1-1_Vesely_lane314s006581_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C10_14s006582-1-1_Vesely_lane314s006582_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C11_14s006583-1-1_Vesely_lane414s006583_sequence.bam \
           /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_C12_14s006584-1-1_Vesely_lane414s006584_sequence.bam

OSKAR_DS = /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_D1_14s006585-1-1_Vesely_lane414s006585_sequence.bam \
		   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_D2_14s006586-1-1_Vesely_lane514s006586_sequence.bam \
		   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_D3_14s006587-1-1_Vesely_lane514s006587_sequence.bam \
		   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_D4_14s006588-1-1_Vesely_lane514s006588_sequence.bam \
		   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_D5_14s006589-1-1_Vesely_lane514s006589_sequence.bam \
		   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_D6_14s006590-1-1_Vesely_lane514s006590_sequence.bam \
		   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_D7_14s006591-1-1_Vesely_lane514s006591_sequence.bam \
		   /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_D8_14s006592-1-1_Vesely_lane514s006592_sequence.bam \
		   /data_synology/christian/iamp/data/current/bam/C88A8ACXX_3H_15s010507-1-1_Vesely_lane515s010507_sequence.txt.gz \
		   /data_synology/christian/iamp/data/current/bam/C7K1TACXX_5H_15s010523-1-1_Vesely_lane115s010523_sequence.txt.gz

OSKAR_CD19 = /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_S1_14s006593-1-1_Vesely_lane314s006593_sequence.bam \
			 /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_S2_14s006594-1-1_Vesely_lane314s006594_sequence.bam \
			 /data_synology/christian/iamp/data/current/bam/C57C3ACXX_CV_S3_14s006595-1-1_Vesely_lane314s006595_sequence.bam

OSKAR_HD = /data_synology/christian/martin/data/fastq/C88A8ACXX_4F_15s010513-1-1_Vesely_lane615s010513_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C7K1TACXX_5D_15s010519-1-1_Vesely_lane115s010519_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_1F_15s010491-1-1_Vesely_lane315s010491_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_4G_15s010514-1-1_Vesely_lane615s010514_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_1E_15s010490-1-1_Vesely_lane315s010490_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_2E_15s010497-1-1_Vesely_lane415s010497_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C7K1TACXX_5C_15s010518-1-1_Vesely_lane115s010518_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_4E_15s010512-1-1_Vesely_lane615s010512_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_2F_15s010498-1-1_Vesely_lane415s010498_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_1G_15s010492-1-1_Vesely_lane315s010492_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_2G_15s010499-1-1_Vesely_lane415s010499_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_4H_15s010515-1-1_Vesely_lane615s010515_sequence.txt.gz \
		   /data_synology/christian/martin/data/fastq/C88A8ACXX_3E_15s010504-1-1_Vesely_lane515s010504_sequence.txt.gz

VERONIKA_REH = /data_synology/christian/helena_veronika/data/bam/29313_TTAGGC_C7TY9ANXX_1_20150723B_20150723.bam \
               /data_synology/christian/helena_veronika/data/bam/29320_TGACCA_C7U15ANXX_1_20150808B_20150808.bam \
               /data_synology/christian/helena_veronika/data/bam/29309_ATCACG_C7TY9ANXX_1_20150723B_20150723.bam \
               /data_synology/christian/helena_veronika/data/bam/29311_CGATGT_C7TY9ANXX_1_20150723B_20150723.bam

HELENA_NALM6 = /data_synology/christian/helena_veronika/data/bam/29319_CAGATC_C7U15ANXX_1_20150808B_20150808.bam \
               /data_synology/christian/helena_veronika/data/bam/29322_ACTTGA_C7U15ANXX_1_20150808B_20150808.bam \
               /data_synology/christian/helena_veronika/data/bam/29310_ACAGTG_C7TY9ANXX_1_20150723B_20150723.bam \
               /data_synology/christian/helena_veronika/data/bam/29321_GCCAAT_C7U15ANXX_1_20150808B_20150808.bam \
               /data_synology/christian/helena_veronika/data/bam/29323_GATCAG_C7U15ANXX_1_20150808B_20150808.bam \
               /data_synology/christian/helena_veronika/data/bam/29312_TAGCTT_C7TY9ANXX_1_20150723B_20150723.bam

CONNY_IKZF1 = /data_synology/christian/ikaros/data/fastq/C7K1TACXX_5A_15s010516-1-1_Vesely_lane115s010516_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C7K1TACXX_5B_15s010517-1-1_Vesely_lane115s010517_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_1A_15s010486-1-1_Vesely_lane315s010486_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_1B_15s010487-1-1_Vesely_lane315s010487_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_1C_15s010488-1-1_Vesely_lane315s010488_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_1D_15s010489-1-1_Vesely_lane315s010489_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_2A_15s010493-1-1_Vesely_lane415s010493_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_2B_15s010494-1-1_Vesely_lane415s010494_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_2C_15s010495-1-1_Vesely_lane415s010495_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_2D_15s010496-1-1_Vesely_lane415s010496_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_3A_15s010500-1-1_Vesely_lane515s010500_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_3B_15s010501-1-1_Vesely_lane515s010501_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_3C_15s010502-1-1_Vesely_lane515s010502_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_3D_15s010503-1-1_Vesely_lane515s010503_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_4A_15s010508-1-1_Vesely_lane615s010508_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_4B_15s010509-1-1_Vesely_lane615s010509_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_4C_15s010510-1-1_Vesely_lane615s010510_sequence.txt.gz \
              /data_synology/christian/ikaros/data/fastq/C88A8ACXX_4D_15s010511-1-1_Vesely_lane615s010511_sequence.txt.gz

CONNY_IKZF1_VALIDATION = /data_synology/christian/ikaros/data/bam/36768_ATCACG_C97W1ANXX_5_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36769_CGATGT_C97W1ANXX_5_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36775_CAGATC_C97W1ANXX_6_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36776_ACTTGA_C97W1ANXX_6_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36782_ATCACG_C97W1ANXX_7_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36783_CGATGT_C97W1ANXX_7_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36771_TGACCA_C97W1ANXX_5_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36778_TAGCTT_C97W1ANXX_6_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36781_TTAGGC_C97W1ANXX_6_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36784_TGACCA_C97W1ANXX_7_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36785_ACAGTG_C97W1ANXX_7_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36770_TTAGGC_C97W1ANXX_5_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36772_ACAGTG_C97W1ANXX_5_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36773_GCCAAT_C97W1ANXX_5_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36774_CAGATC_C97W1ANXX_5_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36777_GATCAG_C97W1ANXX_6_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36779_GGCTAC_C97W1ANXX_6_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36780_CTTGTA_C97W1ANXX_6_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36786_GCCAAT_C97W1ANXX_7_20160225B_20160225.bam \
                         /data_synology/christian/ikaros/data/bam/36787_ACTTGA_C97W1ANXX_7_20160225B_20160225.bam
                         
KASIA_REH = /data_synology/christian/kasia/data/current/bam/33896_ATCACG_C89VTANXX_1_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33897_CGATGT_C89VTANXX_1_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33898_TTAGGC_C89VTANXX_1_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33899_TGACCA_C89VTANXX_1_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33900_ACAGTG_C89VTANXX_1_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33901_GCCAAT_C89VTANXX_1_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33902_CAGATC_C89VTANXX_2_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33903_CTTGTA_C89VTANXX_2_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33904_ATCACG_C89VTANXX_2_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33905_CGATGT_C89VTANXX_2_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33906_TTAGGC_C89VTANXX_2_20151209B_20151209.bam \
			/data_synology/christian/kasia/data/current/bam/33907_TGACCA_C89VTANXX_2_20151209B_20151209.bam

FIKRET = /data_synology/christian/fikret/data/current/bam/C887VACXX_H03_15s014268-1-1_Rifatbegovic_lane515s014268_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR8_14s005696-1-1_Rifatbegovic_lane6D19930612_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR8_14s005696-1-1_Rifatbegovic_lane6D20122162_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR5_14s005693-1-1_Rifatbegovic_lane2D19993072_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR5_14s005693-1-1_Rifatbegovic_lane2D20140613_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H05_15s014270-1-1_Rifatbegovic_lane615s014270_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H07_15s014272-1-1_Rifatbegovic_lane715s014272_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR13_14s005701-1-1_Rifatbegovic_lane7D20102922_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR13_14s005701-1-1_Rifatbegovic_lane7D19980062_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53B2ACXX_FR9_14s005697-1-2_Rifatbegovic_lane2D19991650_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR7_14s005695-1-1_Rifatbegovic_lane5D19981987_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR13_14s005701-1-1_Rifatbegovic_lane7D20020103_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H08_15s014273-1-1_Rifatbegovic_lane715s014273_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR6_14s005694-1-1_Rifatbegovic_lane3D20102326_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR6_14s005694-1-1_Rifatbegovic_lane3D19920825_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR7_14s005695-1-1_Rifatbegovic_lane5D20034304_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR1_14s005689-1-1_Rifatbegovic_lane5D19920551_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_12-919-D_14s001419-1-1_Rifatbegovic_lane214s001419_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR1_14s005689-1-1_Rifatbegovic_lane5D19931141_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR10_14s005698-1-1_Rifatbegovic_lane8D19950581_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR12_14s005700-1-1_Rifatbegovic_lane6D20112208_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR8_14s005696-1-1_Rifatbegovic_lane6D19950614_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR11_14s005699-1-1_Rifatbegovic_lane5D19920841_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR14_14s005702-1-1_Rifatbegovic_lane8D20100681_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H04_15s014269-1-1_Rifatbegovic_lane615s014269_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_H01_15s014266-1-1_Rifatbegovic_lane615s014266_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR10_14s005698-1-1_Rifatbegovic_lane8D20132083_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR11_14s005699-1-1_Rifatbegovic_lane5D19981261_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR3_14s005691-1-1_Rifatbegovic_lane7D20130131_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR10_14s005698-1-1_Rifatbegovic_lane8D19952120_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_09-644-D_14s001416-1-1_Rifatbegovic_lane214s001416_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR2_14s005690-1-1_Rifatbegovic_lane6D19921283_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR3_14s005691-1-1_Rifatbegovic_lane7D19921182_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR4_14s005692-1-1_Rifatbegovic_lane8D19951415_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR2_14s005690-1-1_Rifatbegovic_lane6D19930849_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR2_14s005690-1-1_Rifatbegovic_lane6D20141234_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53B2ACXX_FR9_14s005697-1-2_Rifatbegovic_lane2D20090606_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR4_14s005692-1-1_Rifatbegovic_lane8D19950029_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H10_15s014275-1-1_Rifatbegovic_lane815s014275_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H11_15s014276-1-1_Rifatbegovic_lane815s014276_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR3_14s005691-1-1_Rifatbegovic_lane7D19941911_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR10_14s005698-1-1_Rifatbegovic_lane8M19952120_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR5_14s005693-1-1_Rifatbegovic_lane2M20140613_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_11-919-M_14s001418-1-1_Rifatbegovic_lane214s001418_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR8_14s005696-1-1_Rifatbegovic_lane6M19930612_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR8_14s005696-1-1_Rifatbegovic_lane6M20122162_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR7_14s005695-1-1_Rifatbegovic_lane5M20034304_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53B2ACXX_FR9_14s005697-1-2_Rifatbegovic_lane2M19991650_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR14_14s005702-1-1_Rifatbegovic_lane8M19981897_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR11_14s005699-1-1_Rifatbegovic_lane5M19920841_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR13_14s005701-1-1_Rifatbegovic_lane7M20020103_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR10_14s005698-1-1_Rifatbegovic_lane8M19950581_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR11_14s005699-1-1_Rifatbegovic_lane5M19981261_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR1_14s005689-1-1_Rifatbegovic_lane5M19931141_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR3_14s005691-1-1_Rifatbegovic_lane7M20130131_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR6_14s005694-1-1_Rifatbegovic_lane3M20102326_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR8_14s005696-1-1_Rifatbegovic_lane6M19950614_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR2_14s005690-1-1_Rifatbegovic_lane6M19921283_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR10_14s005698-1-1_Rifatbegovic_lane8M20132083_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR13_14s005701-1-1_Rifatbegovic_lane7M19980062_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR5_14s005693-1-1_Rifatbegovic_lane2M19993072_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR3_14s005691-1-1_Rifatbegovic_lane7M19921182_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR4_14s005692-1-1_Rifatbegovic_lane8M19951415_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR4_14s005692-1-1_Rifatbegovic_lane8M19950029_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_08-644-M_14s001415-1-1_Rifatbegovic_lane214s001415_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR1_14s005689-1-1_Rifatbegovic_lane5M19920551_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR13_14s005701-1-1_Rifatbegovic_lane7M20102922_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR7_14s005695-1-1_Rifatbegovic_lane5M19981987_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR3_14s005691-1-1_Rifatbegovic_lane7M19941911_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR6_14s005694-1-1_Rifatbegovic_lane3M19920825_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR2_14s005690-1-1_Rifatbegovic_lane6M19930849_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53B2ACXX_FR9_14s005697-1-2_Rifatbegovic_lane2M20090606_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR2_14s005690-1-1_Rifatbegovic_lane6M20141234_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR14_14s005702-1-1_Rifatbegovic_lane8M20100681_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR6_14s005694-1-1_Rifatbegovic_lane3M20114162_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_01-15-BM100_14s001408-1-1_Rifatbegovic_lane114s001408_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_04-6-BM100_14s001411-1-1_Rifatbegovic_lane114s001411_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR11_14s005699-1-1_Rifatbegovic_lane5T19981261_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_10-919-T_14s001417-1-1_Rifatbegovic_lane214s001417_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_07-644-T_14s001414-1-1_Rifatbegovic_lane214s001414_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_D05_15s014162-1-1_Rifatbegovic_lane815s014162_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_D08_15s014165-1-1_Rifatbegovic_lane115s014165_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F01_15s014242-1-1_Rifatbegovic_lane215s014242_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F05_15s014246-1-1_Rifatbegovic_lane315s014246_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F07_15s014248-1-1_Rifatbegovic_lane415s014248_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_E11_15s014240-1-1_Rifatbegovic_lane315s014240_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F08_15s014249-1-1_Rifatbegovic_lane415s014249_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F09_15s014250-1-1_Rifatbegovic_lane515s014250_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G01_15s014254-1-1_Rifatbegovic_lane415s014254_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F11_15s014252-1-1_Rifatbegovic_lane515s014252_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G02_15s014255-1-1_Rifatbegovic_lane415s014255_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G03_15s014256-1-1_Rifatbegovic_lane515s014256_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C11_15s014153-1-1_Rifatbegovic_lane715s014153_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_D01_15s014158-1-1_Rifatbegovic_lane715s014158_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_D02_15s014159-1-1_Rifatbegovic_lane715s014159_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_D03_15s014160-1-1_Rifatbegovic_lane715s014160_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_D04_15s014161-1-1_Rifatbegovic_lane815s014161_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_02-15-BM30_14s001409-1-1_Rifatbegovic_lane114s001409_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_03-15-BM0_14s001410-1-1_Rifatbegovic_lane114s001410_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_05-6-BM30_14s001412-1-1_Rifatbegovic_lane114s001412_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C3JP8ACXX_06-6-BM0_14s001413-1-1_Rifatbegovic_lane114s001413_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR4_14s005692-1-1_Rifatbegovic_lane8T19950029_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR7_14s005695-1-1_Rifatbegovic_lane5T20034304_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR7_14s005695-1-1_Rifatbegovic_lane5T220034304_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53B2ACXX_FR9_14s005697-1-2_Rifatbegovic_lane2T19991650_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53B2ACXX_FR9_14s005697-1-2_Rifatbegovic_lane22T19991650_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C4GRWACXX_FR1_14s005689-1-1_Rifatbegovic_lane5D219931141_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR14_14s005702-1-1_Rifatbegovic_lane8D19981897_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR12_14s005700-1-1_Rifatbegovic_lane6M20112208_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR12_14s005700-1-1_Rifatbegovic_lane6D20070342_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR12_14s005700-1-1_Rifatbegovic_lane6M20070342_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR12_14s005700-1-1_Rifatbegovic_lane6D20063040_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR12_14s005700-1-1_Rifatbegovic_lane6M20063040_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A01_15s014118-1-1_Rifatbegovic_lane115s014118_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A02_15s014119-1-1_Rifatbegovic_lane115s014119_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A03_15s014120-1-1_Rifatbegovic_lane115s014120_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A04_15s014121-1-1_Rifatbegovic_lane215s014121_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A05_15s014122-1-1_Rifatbegovic_lane215s014122_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A06_15s014123-1-1_Rifatbegovic_lane315s014123_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A07_15s014124-1-1_Rifatbegovic_lane315s014124_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A08_15s014125-1-1_Rifatbegovic_lane515s014125_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A09_15s014126-1-1_Rifatbegovic_lane515s014126_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A10_15s014127-1-1_Rifatbegovic_lane515s014127_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A11_15s014128-1-1_Rifatbegovic_lane615s014128_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_A12_15s014129-1-1_Rifatbegovic_lane615s014129_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B01_15s014130-1-1_Rifatbegovic_lane115s014130_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B02_15s014131-1-1_Rifatbegovic_lane115s014131_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B03_15s014132-1-1_Rifatbegovic_lane115s014132_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B04_15s014133-1-1_Rifatbegovic_lane215s014133_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B05_15s014134-1-1_Rifatbegovic_lane315s014134_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B06_15s014135-1-1_Rifatbegovic_lane415s014135_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B07_15s014136-1-1_Rifatbegovic_lane415s014136_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B08_15s014137-1-1_Rifatbegovic_lane415s014137_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B09_15s014138-1-1_Rifatbegovic_lane515s014138_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B10_15s014139-1-1_Rifatbegovic_lane515s014139_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B11_15s014140-1-1_Rifatbegovic_lane615s014140_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_B12_15s014141-1-1_Rifatbegovic_lane615s014141_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C01_15s014143-1-1_Rifatbegovic_lane215s014143_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C02_15s014144-1-1_Rifatbegovic_lane215s014144_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C03_15s014145-1-1_Rifatbegovic_lane215s014145_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C04_15s014146-1-1_Rifatbegovic_lane315s014146_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C05_15s014147-1-1_Rifatbegovic_lane315s014147_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C06_15s014148-1-1_Rifatbegovic_lane315s014148_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C07_15s014149-1-1_Rifatbegovic_lane415s014149_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C08_15s014150-1-1_Rifatbegovic_lane415s014150_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C09_15s014151-1-1_Rifatbegovic_lane415s014151_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C10_15s014152-1-1_Rifatbegovic_lane515s014152_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G07_15s014260-1-1_Rifatbegovic_lane615s014260_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G08_15s014261-1-1_Rifatbegovic_lane715s014261_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_H02_15s014267-1-1_Rifatbegovic_lane615s014267_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_D10_15s014167-1-1_Rifatbegovic_lane215s014167_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_E08_15s014237-1-1_Rifatbegovic_lane215s014237_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_E03_15s014232-1-1_Rifatbegovic_lane815s014232_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_E01_15s014230-1-1_Rifatbegovic_lane715s014230_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_D06_15s014163-1-1_Rifatbegovic_lane815s014163_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F10_15s014251-1-1_Rifatbegovic_lane515s014251_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_C12_15s014154-1-1_Rifatbegovic_lane715s014154_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_E02_15s014231-1-1_Rifatbegovic_lane815s014231_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C88B4ACXX_E04_15s014233-1-1_Rifatbegovic_lane815s014233_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_D07_15s014164-1-1_Rifatbegovic_lane115s014164_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_D09_15s014166-1-1_Rifatbegovic_lane115s014166_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_D11_15s014168-1-1_Rifatbegovic_lane215s014168_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_D12_15s014169-1-1_Rifatbegovic_lane315s014169_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_E05_15s014234-1-1_Rifatbegovic_lane115s014234_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_E06_15s014235-1-1_Rifatbegovic_lane115s014235_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_E07_15s014236-1-1_Rifatbegovic_lane115s014236_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_E09_15s014238-1-1_Rifatbegovic_lane315s014238_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_E10_15s014239-1-1_Rifatbegovic_lane315s014239_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_E12_15s014241-1-1_Rifatbegovic_lane415s014241_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F02_15s014243-1-1_Rifatbegovic_lane215s014243_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F03_15s014244-1-1_Rifatbegovic_lane215s014244_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F04_15s014245-1-1_Rifatbegovic_lane315s014245_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F06_15s014247-1-1_Rifatbegovic_lane415s014247_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_F12_15s014253-1-1_Rifatbegovic_lane615s014253_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G04_15s014257-1-1_Rifatbegovic_lane515s014257_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G05_15s014258-1-1_Rifatbegovic_lane615s014258_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G06_15s014259-1-1_Rifatbegovic_lane615s014259_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G09_15s014262-1-1_Rifatbegovic_lane715s014262_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G10_15s014263-1-1_Rifatbegovic_lane715s014263_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G11_15s014264-1-1_Rifatbegovic_lane815s014264_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_G12_15s014265-1-1_Rifatbegovic_lane815s014265_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H12_15s014277-1-1_Rifatbegovic_lane815s014277_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H06_15s014271-1-1_Rifatbegovic_lane715s014271_sequence.bam \
         /data_synology/christian/fikret/data/current/bam/C887VACXX_H09_15s014274-1-1_Rifatbegovic_lane815s014274_sequence.bam

#        /data_synology/christian/fikret/data/current/bam/C5324ACXX_FR6_14s005694-1-1_Rifatbegovic_lane3D20114162_sequence.bam    # not enough reads
#        /data_synology/christian/fikret/data/current/bam/C53DNACXX_FR14_14s005702-1-1_Rifatbegovic_lane8M20035050_sequence.bam   # not enough reads


#jaffa: $(MAX_EWING) $(FIONA_NALM6_1ST_BATCH) $(FIONA_NALM6_2ND_BATCH) $(OSKAR_IAMP21) $(OSKAR_ER) $(OSKAR_DS) $(OSKAR_CD19) $(OSKAR_HD) $(VERONIKA_REH) $(HELENA_NALM6) $(CONNY_IKZF1) $(CONNY_IKZF1_VALIDATION) $(KASIA_REH)
#	$(JAFFA) -p readLayout="single" -n 7 /usr/local/JAFFA-version-1.06/JAFFA_assembly.groovy $^

jaffa: $(MAX_EWING) $(FIONA_NALM6_1ST_BATCH) $(FIONA_NALM6_2ND_BATCH) $(OSKAR_IAMP21) $(OSKAR_ER) $(OSKAR_DS) $(OSKAR_CD19) $(OSKAR_HD) $(VERONIKA_REH) $(HELENA_NALM6) $(CONNY_IKZF1) $(CONNY_IKZF1_VALIDATION) $(KASIA_REH) $(FIKRET)
	$(JAFFA) -p readLayout="single" -n 7 /usr/local/JAFFA-version-1.06/JAFFA_assembly.groovy $^
	
jaffa_results.annotated.tsv: jaffa_results.csv /mnt/projects/jaffa/scripts/annotate_fusions.R
	Rscript /mnt/projects/jaffa/scripts/annotate_fusions.R

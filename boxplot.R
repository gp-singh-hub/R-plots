rm(list=ls(all=TRUE))
setwd("/Users/gajindersingh/gp/nfrex/clinical_trials");
library(ggplot2);
require(reshape2)
library("dplyr")

dat <- read.table("trialduration_disease_meshsystem.txt", header=T, sep="\t") #read input file

#order the variables as per the Mesh Systems, this unfortunately has to be manually specified
dat$condition_mesh_terms <- factor(dat$condition_mesh_terms, levels = c("Heart Diseases","Cardiovascular Diseases","Coronary Disease","Myocardial Ischemia","Coronary Artery Disease","Hypertension","Heart Failure","Hepatitis","Hepatitis_Chronic","Fatty Liver","Non-alcoholic Fatty Liver Disease","Colitis","Colitis_Ulcerative","Crohn Disease","Liver Diseases","Irritable Bowel Syndrome","Keratoconjunctivitis Sicca","Dry Eye Syndromes","Macular Edema","Macular Degeneration","Glaucoma","Glaucoma_Open-Angle","Ocular Hypertension","Conjunctivitis","Premature Birth","Myelodysplastic Syndromes","Myeloproliferative Disorders","Myelodysplastic-Myeloproliferative Diseases","Anemia","Thrombocytopenia","Primary Myelofibrosis","Graft vs Host Disease","Hypersensitivity","Tuberculosis","Virus Diseases","Malaria","Depressive Disorder","Depressive Disorder_Major","Attention Deficit Disorder with Hyperactivity","Schizophrenia","Psychotic Disorders","Bipolar Disorder","Anxiety Disorders","Cognitive Dysfunction","Autistic Disorder","Arthritis","Osteoarthritis","Osteoarthritis_Knee","Leukemia","Leukemia_Myeloid","Leukemia_Myeloid_Acute","Head and Neck Neoplasms","Glioma","Neoplasms_Plasma Cell","Melanoma","Glioblastoma","Astrocytoma","Carcinoma","Adenocarcinoma","Sarcoma","Mesothelioma","Cholangiocarcinoma","Neuroblastoma","Neoplasms","Neuroendocrine Tumors","Carcinoma_Squamous Cell","Carcinoma_Transitional Cell","Gliosarcoma","Squamous Cell Carcinoma of Head and Neck","Parkinson Disease","Peripheral Nervous System Diseases","Motor Neuron Disease","Migraine Disorders","Epilepsy","Hypercholesterolemia","Metabolic Syndrome","Dyslipidemias","Lung Diseases","Lung Diseases_Obstructive","Pulmonary Disease_Chronic Obstructive","Psoriasis","Keratosis","Dermatitis","Acne Vulgaris","Eczema","Periodontitis"));
dat.m <- melt (dat)

p <- ggplot(data = dat.m, aes(x=condition_mesh_terms, y=value, color =MeshSystem)) +  
  #geom_violin(position = position_dodge(width=.99),draw_quantiles = c(0.5)) +
  geom_boxplot(position = position_dodge(width=0.99),outlier.shape = NA) +
  geom_point(size = 1,position=position_jitterdodge(dodge.width=.99)) + #+
  #ylim(c(-0.4,0.4)) +
  xlab("") +
  ylab("Phase 2 trial duration (days)") +
  theme(axis.text = element_text(size =15),axis.text.x = element_text(size = 8, angle = 45),axis.title = element_text(size =15),legend.text=element_text(size=9)) 
p+ scale_y_log10()

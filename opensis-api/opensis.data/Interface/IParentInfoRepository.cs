﻿using opensis.data.Models;
using opensis.data.ViewModels.ParentInfos;
using System;
using System.Collections.Generic;
using System.Text;

namespace opensis.data.Interface
{
    public interface IParentInfoRepository
    {
        public ParentInfoAddViewModel AddParentForStudent(ParentInfoAddViewModel parentInfoAddViewModel);
        public ParentInfoListModel ViewParentListForStudent(ParentInfoListModel parentInfoListModel);
        public ParentInfoAddViewModel UpdateParentInfo(ParentInfoAddViewModel parentInfoAddViewModel);
        public GetAllParentInfoListForView GetAllParentInfoList(PageResult pageResult);
        public ParentInfoAddViewModel DeleteParentInfo(ParentInfoAddViewModel parentInfoAddViewModel);
        public GetAllParentInfoListForView SearchParentInfoForStudent(GetAllParentInfoListForView getAllParentInfoListForView);
        public ParentInfoAddViewModel ViewParentInfo(ParentInfoAddViewModel parentInfoAddViewModel);
        public ParentInfoAddViewModel AddParentInfo(ParentInfoAddViewModel parentInfoAddViewModel);
        public ParentInfoDeleteViewModel RemoveAssociatedParent(ParentInfoDeleteViewModel parentInfoDeleteViewModel);
    }
}

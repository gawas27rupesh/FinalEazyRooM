<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required Meta tags  -->
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <link rel="stylesheet" href="./resources/css/alert.css">

 

</head>
<body>
    <div class="wrapper" th:fragment="alerts">
        <!-- =============================================================================================================  -->
        <!-- ------------------- ***** Modal For Login Pages ***** -------------------------  -->
        <!-- User id Or password Incorrect  -->
        <div class="modal errorModal" tabindex="-1" id="incorrectIdOrPass" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText text-center"> Sorry! User ID or Password Is Incorrect</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =============================================================================================================  -->
        <!-- Logged Out Message  -->
        <div class="modal saveModal" tabindex="-1" id="logOutSuccess" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="saveAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="saveText" id="SuccesText"> You have successfully logged out...!</span>

                        <button type="button" class="btn saveOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- =============================================================================================================  -->
        <!-- Your session has been time out  -->
        <div class="modal errorModal" tabindex="-1" id="seesionTimeOut" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Your session has been timed out...!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- =============================================================================================================  -->
        <!-- ------------------- ***** Modal For Login Pages End ***** -------------------------  -->
        <!-- =============================================================================================================  -->


        <!-- =============================================================================================================  -->
        <!-- Modal for Save  -->
        <div class="modal saveModal" tabindex="-1" id="saveModal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="saveAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="saveText"> Saved Successfully</span>

                        <button type="button" class="btn saveOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for Save End -->

        <!-- ------------------------------------------------------------------------------ -->

        <!-- Modal for Update  -->
        <div class="modal updateModal" tabindex="-1" id="updateModal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="updateAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="updateText" id="unique"> Updated Successfully</span>

                        <button type="button" class="btn updateOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for Update End -->

        <!-- ------------------------------------------------------------------------------ -->

        <!-- Modal for Delete Confirmation  -->
        <div class="modal delConfirmModal" tabindex="-1" id="delConfirmModal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="confirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for Delete Confirmation  -->
        <!-- ------------------------------------------------------------------------------ -->

        <!-- Modal for Delete -->
        <div class="modal deleteModal" tabindex="-1" id="deleteModal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for Delete End -->

        <!-- ----------------------------------------------------------------------------  -->
        <!-- Modal for can't Delete Its in use -->
        <div class="modal cantDeleteModal" tabindex="-1" id="cantDeleteModal" data-bs-dismiss="modal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Can't Delete, It is in use!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for can't Delete Its in use End-->

        <!-- ----------------------------------------------------------------------------  -->
        <!-- Modal for Error Occured -->
        <div class="modal errorModal" tabindex="-1" id="errorModal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Error Occured!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal for Error Occured End-->

        <!-- ==================================================================================================================  -->
        <!-- ==================================================================================================================  -->


        <!-- --------------------------------- ******  Modals for specific Messages ****** ------------------------------------- -->
        <!-- ========================= *** Module RTM *** =========================  -->
        <!-- RTM In use cant delete  -->
        <div class="modal inputErrorModal" tabindex="-1" id="rtmInUse" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> RTM In Use, Can't Delete</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- RTM In use cant delete  -->
        <!-- =========================================================================================================  -->
        <!-- Please Enter BR-ID  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsBrId" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Please Enter Br Id!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Enter Req-Id  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsReqId" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Please Enter Requirement Id!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Enter Requirement  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsEnterRequirement" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Please Enter <span id="addtextalert"></span>!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Enter Requirement Description  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsReqDescription" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Please Enter Requirement Description!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Req-Id Is Already Used  -->
        <div class="modal inputErrorModal" tabindex="-1" id="reqIdAlreadyUsed" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Req-Id Is Already In Used </span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Pleae Fill the Data  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsFillData" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Please Fill the Data</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Select Row for Edit  -->
        <div class="modal inputErrorModal" tabindex="-1" id="selectRowForEdit" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Please Select the Row for Edit</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- There is Nothing to Update  -->
        <div class="modal inputErrorModal" tabindex="-1" id="nothingToUpdate" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> There's Nothing To Update!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Status Updated Successfully  -->
        <div class="modal updateModal" tabindex="-1" id="statusUpdateModal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="updateAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="updateText"> Status Updated Successfully!</span>

                        <button type="button" class="btn updateOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Something Went Wrong  -->
        <div class="modal inputErrorModal" tabindex="-1" id="somethingWrong" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Something Went Wrong!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- ========================= *** Module RTM End *** =========================  -->

        <!-- ==========================================    ****************  =========================================== -->
        <!-- ========================= *** Module Test Scenario  *** =========================  -->
        <!-- Please select Requirement Id  -->
        <div class="modal inputErrorModal" tabindex="-1" id="selectReqId" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> Please Select Requirement Id!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Enter TestScenario Id  -->
        <div class="modal inputErrorModal" tabindex="-1" id="enterTestScenId" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Please Enter Test Scenario Id!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Enter Test Scenario  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsEnterTestScenario" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Please Enter Test Scenario!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Select Req Id  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsSelectReqId" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Please Select Requirement Id!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Test Scenario Id Is Already in Used  -->
        <div class="modal inputErrorModal" tabindex="-1" id="tsidAlreadyUsed" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Test Scenario Id Is Already In Used!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- =========================================================================================================  -->
        <!-- There Is Nothing To Update  -->
        <div class="modal inputErrorModal" tabindex="-1" id="nothingToUpdate" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText"> There's Nothing To Update!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- ========================= *** Module Test Scenario End *** =========================  -->

        <!-- ==========================================    ****************  =========================================== -->
        <!-- ========================= *** Module Test Case  *** =========================  -->
        <!-- No projects assigned to you  -->
        <div class="modal inputErrorModal" tabindex="-1" id="noProjectAssigned" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">No Project Assigned To You!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Select TestScenario Id  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsSelTestScenId" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Please Select TestScenario Id!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Enter TestCase Id  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsEnterTestCaseId" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Please Enter TestCase Id!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Please Enter Test Case  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsEnterTestCase" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Please Enter TestCase!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- =========================================================================================================  -->
        <!-- TestCase Id is already Entered  -->
        <div class="modal inputErrorModal" tabindex="-1" id="tsCaseAlreadyEntered" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Testcase-Id Is Already Entered!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- =========================================================================================================  -->
        <!-- Please add the Data  -->
        <div class="modal inputErrorModal" tabindex="-1" id="plsAddData" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Please Add The Data!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- There is nothing To Update  -->
        <div class="modal inputErrorModal" tabindex="-1" id="nothingToUpdate" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">There's Nothing To Update!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- Test Case In Use can't Delete  -->
        <div class="modal inputErrorModal" tabindex="-1" id="tscaseInUse" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">Test Case In Use,Can't Delete!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- You have reached the limit of 1000 character  -->
        <div class="modal inputErrorModal" tabindex="-1" id="charLimitExceeded" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText">You have reached a limit of 1000 Characters!</span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- TestCase Status Updated  -->
        <div class="modal saveModal" tabindex="-1" id="tsCaseStatUpdated" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left: 0">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="saveAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="saveText"> Testcase Status Updated</span>

                        <button type="button" class="btn saveOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->
        <!-- ========================= *** Module Test Case End *** =========================  -->



 <!-- =========================================================================================================  -->
        <!-- ========================= *** Module Test Script Start *** =========================  -->

        <!-- =========================================================================================================  -->
        <!-- Warning Popup  -->
        <div class="modal inputErrorModal" tabindex="-1" id="Warning_Popup" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText" id="Text"></span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- =========================================================================================================  -->



<!-- ------------------------------------------------------------------------------ -->

        <!-- Modal for Delete Confirmation  -->
        <div class="modal delConfirmModal" tabindex="-1" id="TestScriptdelConfirmModal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="ScriptconfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>
        
<!-- =========================================================================================================  -->
     <!-- ------------------------------------------------------------------------------ -->

        <!-- Modal for Delete Confirmation  -->
        <div class="modal delConfirmModal" tabindex="-1" id="TestScriptdelConfirmModal1" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="ScriptconfirmDelete1"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>
        
<!-- =========================================================================================================  -->
     
     
     <!-- ------------------------------------------------------------------------------ -->

        <!-- Modal for Delete Confirmation  -->
        <div class="modal delConfirmModal" tabindex="-1" id="TestScriptdelConfirmModal2" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="ScriptconfirmDelete2"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>
        
<!-- =========================================================================================================  -->
      <!-- ------------------------------------------------------------------------------ -->

        <!-- Modal for Delete Confirmation  -->
        <div class="modal delConfirmModal" tabindex="-1" id="TestScriptdelConfirmModal3" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="ScriptconfirmDelete3"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>
        
<!-- =========================================================================================================  -->
      
      <!-- =========================================================================================================  -->
        <!-- Loader Popup  -->
        <div class="modal inputErrorModal1" data-bs-keyboard="false" data-bs-backdrop="false" tabindex="-1" id="Loader" style="z-index:999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left:0px!important; background-color:transparent!important; border:none">
                    <div class="modal-body">
                       
   <main>
   <div class="dank-ass-loader">
      <div class="row row1">
         <div class="arrow up outer outer-18"></div>
         <div class="arrow down outer outer-17"></div>
         <div class="arrow up outer outer-16"></div>
         <div class="arrow down outer outer-15"></div>
         <div class="arrow up outer outer-14"></div>
      </div>
      <div class="row row1">
         <div class="arrow up outer outer-1"></div>
         <div class="arrow down outer outer-2"></div>
         <div class="arrow up inner inner-6"></div>
         <div class="arrow down inner inner-5"></div>
         <div class="arrow up inner inner-4"></div>
         <div class="arrow down outer outer-13"></div>
         <div class="arrow up outer outer-12"></div>
      </div>
      <div class="row row1">
         <div class="arrow down outer outer-3"></div>
         <div class="arrow up outer outer-4"></div>
         <div class="arrow down inner inner-1"></div>
         <div class="arrow up inner inner-2"></div>
         <div class="arrow down inner inner-3"></div>
         <div class="arrow up outer outer-11"></div>
         <div class="arrow down outer outer-10"></div>
      </div>
      <div class="row row1">
         <div class="arrow down outer outer-5"></div>
         <div class="arrow up outer outer-6"></div>
         <div class="arrow down outer outer-7"></div>
         <div class="arrow up outer outer-8"></div>
         <div class="arrow down outer outer-9"></div>
      </div>
   </div>
</main>
                      
						</div>
                    </div>
                </div>
            </div>


        
        <!-- =========================================================================================================  -->
            <!-- Modal for test result confirm -->
        <div class="modal delConfirmModal" tabindex="-1" id="resultDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="resultDeleteConfirm"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>

        <!-- Test Result status updated  -->
        <div class="modal saveModal" tabindex="-1" id="tResultStatUpdated" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left: 0">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="saveAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="saveText"> Test Result Status Updated</span>

                        <button type="button" class="btn saveOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Test script status updated  -->
        <div class="modal saveModal" tabindex="-1" id="tScriptStatUpdated" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="margin-left: 0">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="saveAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="saveText"> Test Script Status Updated</span>

                        <button type="button" class="btn saveOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
    
        <!-- ========================= *** Module Test Script End *** =========================  -->

        <!-- ========================================================================================================================  -->
        <!-- ========================================================================================================================  -->
        <!-- Modals for RTM Delete  -->
         <!-- Modal for Main RTM Delete -->
         <div class="modal deleteModal" tabindex="-1" id="mainRTMDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for main RTM Delete Confirmation  -->
        <div class="modal delConfirmModal" tabindex="-1" id="mainDeleteConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="mainConfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>

        <!-- =================================================================================================================  -->

        <!-- RTM add delete  -->
        <div class="modal deleteModal" tabindex="-1" id="addRTMDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
         <!-- Modal for add RTM Delete Confirmation  -->
         <div class="modal delConfirmModal" tabindex="-1" id="addDeleteConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="addconfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>

        <!-- =============================================================================================================  -->

        <!-- RTM edit delete  -->
        <div class="modal deleteModal" tabindex="-1" id="editRTMDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

         <!-- Modal for edit RTM Delete Confirmation  -->
         <div class="modal delConfirmModal" tabindex="-1" id="rtmeditDelConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="editRTmconfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>
        <!-- =====================================================================================================================   -->
        <!-- Modal for can't Delete Its in use -->
        <div class="modal cantDeleteModal" tabindex="-1" id="cantDeleteModal1" data-bs-dismiss="modal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Can't Delete, It is in use!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for can't Delete Its in use -->
        <div class="modal cantDeleteModal" tabindex="-1" id="cantDeleteModal2" data-bs-dismiss="modal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Can't Delete, It is in use!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for can't Delete Its in use -->
        <div class="modal cantDeleteModal" tabindex="-1" id="cantDeleteModal3" data-bs-dismiss="modal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Can't Delete, It is in use!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- ======================================================================================================================= -->
        <!-- ======================================================================================================================= -->
        <!-- ======================================================================================================================= -->
             
        <!-- Modals for test scenario Delete  -->
        <!-- Modal for Main Test Scenario Delete -->
        <div class="modal deleteModal" tabindex="-1" id="mainTsDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for main Test Scenario Delete Confirmation  -->
        <div class="modal delConfirmModal" tabindex="-1" id="TSDeleteConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="TsConfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>

        <!-- =================================================================================================================  -->

        <!-- Test Scenario add delete  -->
        <div class="modal deleteModal" tabindex="-1" id="addTsDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
         <!-- Modal for add Test Scenario Delete Confirmation  -->
         <div class="modal delConfirmModal" tabindex="-1" id="addTsDeleteConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="addTsconfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>

        <!-- =============================================================================================================  -->

        <!-- Test Scenario edit delete  -->
        <div class="modal deleteModal" tabindex="-1" id="editTsDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

         <!-- Modal for edit Test Scenario Delete Confirmation  -->
         <div class="modal delConfirmModal" tabindex="-1" id="editTsDeleteConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="editTsconfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>


        <!-- ======================================================================================================================= -->
        <!-- ======================================================================================================================= -->
        <!-- ======================================================================================================================= -->
             
        <!-- Modals for test case Delete  -->
        <!-- Modal for Main test case Delete -->
        <div class="modal deleteModal" tabindex="-1" id="mainTcDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Modal for main test case Delete Confirmation  -->
        <div class="modal delConfirmModal" tabindex="-1" id="TcDeleteConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="TcConfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>

        <!-- =================================================================================================================  -->

        <!-- test case add delete  -->
        <div class="modal deleteModal" tabindex="-1" id="addTcDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
         <!-- Modal for add test case Delete Confirmation  -->
         <div class="modal delConfirmModal" tabindex="-1" id="addTcDeleteConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="addTcconfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>

        <!-- =============================================================================================================  -->

        <!-- test case edit delete  -->
        <div class="modal deleteModal" tabindex="-1" id="editTcDelete" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="deleteAnimation"
                                src="https://assets5.lottiefiles.com/packages/lf20_yom6uvgj.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="deleteText"> Deleted Successfully</span>

                        <button type="button" class="btn deleteOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

         <!-- Modal for edit test case Delete Confirmation  -->
         <div class="modal delConfirmModal" tabindex="-1" id="editTcDeleteConfirm" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <span class="deleteText"> Are You Sure</span>
                        <span class="deleteText"> You Want To Delete?</span>
                        </button>
                    </div>
                    <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                        <button type="button" class="btn ConfirmYes" id="editTcconfirmDelete"> Yes </button>
                        <div class="mx-3"></div>
                        <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No
                    </div>
                </div>
            </div>
        </div>

        <!-- ==============================================================================================================================  -->
        <!-- Test case cant delete  -->
        <div class="modal cantDeleteModal" tabindex="-1" id="cantDeleteModalTc1" data-bs-dismiss="modal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Can't Delete, It is in use!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal cantDeleteModal" tabindex="-1" id="cantDeleteModalTc2" data-bs-dismiss="modal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Can't Delete, It is in use!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal cantDeleteModal" tabindex="-1" id="cantDeleteModalTc3" data-bs-dismiss="modal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Can't Delete, It is in use!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal cantDeleteModal" tabindex="-1" id="cantDeleteModalTc4" data-bs-dismiss="modal" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="WarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="WarningText"> Can't Delete, It is in use!!</span>

                        <button type="button" class="btn warningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- ===================================================================================================================   -->
        <!-- ------------------------------------------------------------------------------ -->



               <!-- Modal for Delete buggggg Confirmation  -->
                <div class="modal delConfirmModal" tabindex="-1" id="BugDeleteModule" style="z-index:9999;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="margin-left:0px!important;">
                            <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                                <span class="deleteText"> Are You Sure</span>
                                <span class="deleteText"> You Want To Delete?</span>
                            
                            </div>
                            <div class="modal-footer buttons-group d-flex justify-content-center align-items-center">
                                <button type="button" class="btn ConfirmYes" id="BugDelete"> Yes </button>
                                <div class="mx-3"></div>
                                <button type="button" class="btn confrimNo" data-bs-dismiss="modal"> No</button>
                            </div>
                        </div>
                    </div>
                </div>
        <!--start of Please fill Required fields -->
                <div class="modal inputErrorModal" tabindex="-1" id="req_fields" style="z-index:9999;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="margin-left:0px!important;">
                            <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                                <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                                    <lottie-player class="inptWarningAnimation"
                                        src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                        background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                                </div>
                                <span class="inputWarningText" id="Text"></span>
                                <h5> Please fill Required fields</h5>
                                <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                            </div>
                        </div>
                    </div>
                </div>
        <!--End of Please fill Required fields  -->
        
        
        
        <!--start of Please Select Priority!  -->
            <div class="modal inputErrorModal" tabindex="-1" id="priority_swal" style="z-index:9999;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="margin-left:0px!important;">
                            <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                                <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                                    <lottie-player class="inptWarningAnimation"
                                        src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                        background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                                </div>
                                <span class="inputWarningText" id="Text"></span>
                                <h5> Please Select Priority!</h5>
                                <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                            </div>
                        </div>
                    </div>
                </div>
        <!--end of Please Select Priority!  -->
        
        
        
        <!--start of assigned_swal-->
           <div class="modal inputErrorModal" tabindex="-1" id="assigned_swal" style="z-index:9999;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="margin-left:0px!important;">
                            <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                                <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                                    <lottie-player class="inptWarningAnimation"
                                        src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                        background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                                </div>
                                <span class="inputWarningText" id="Text"></span>
                                <h5>Please Select Assigned to</h5>
                                <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- End of assigned_swal -->
        
        
        
        <!--start of Test Round should be Number  -->
           <div class="modal inputErrorModal" tabindex="-1" id="testround_swal" style="z-index:9999;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="margin-left:0px!important;">
                            <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                                <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                                    <lottie-player class="inptWarningAnimation"
                                        src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                        background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                                </div>
                                <span class="inputWarningText" id="Text"></span>
                                <h5>Test Round should be Number</h5>
                                <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- end of Test Round should be Number -->
        
        
        
        <!--start of Please Select Status By Tester  -->
           <div class="modal inputErrorModal" tabindex="-1" id="statusTester_swal" style="z-index:9999;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="margin-left:0px!important;">
                            <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                                <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                                    <lottie-player class="inptWarningAnimation"
                                        src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                        background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                                </div>
                                <span class="inputWarningText" id="Text"></span>
                                <h5>Please Select Status By Tester</h5>
                                <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                            </div>
                        </div>
                    </div>
                </div>
        <!--end of Please Select Status By Tester  -->
        
        
        
        <!--Start of Test Round Should be a number!  -->
        <div class="modal inputErrorModal" tabindex="-1" id="test_RoundNum" style="z-index:9999;">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content" style="margin-left:0px!important;">
                            <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                                <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                                    <lottie-player class="inptWarningAnimation"
                                        src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                        background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                                </div>
                                <span class="inputWarningText" id="Text"></span>
                                <h5>Test Round Should be a number! </h5>
                                <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                            </div>
                        </div>
                    </div>
                </div>
        <!-- End of Test Round Should be a number! -->
	<!-- Login page role user popup -->
	<div class="modal inputErrorModal" tabindex="-1" id="warning_popup1" style="z-index:9999;">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="height:290px!important;">
                    <div class="modal-body d-flex flex-column justify-content-center align-items-center">
                        <div class="animationWrapper d-flex flex-column justify-content-center align-items-center">
                            <lottie-player class="inptWarningAnimation"
                                src="https://assets5.lottiefiles.com/private_files/lf30_jtkhrafm.json"
                                background="transparent" speed="1" loop="" autoplay=""></lottie-player>
                        </div>
                        <span class="inputWarningText" id="warning_input"></span>

                        <button type="button" class="btn inputwarningOk" data-bs-dismiss="modal"> OK</button>
                    </div>
                </div>
            </div>
        </div>
	<!--end of Login page role user popup -->
    </div>
    <!-- ================================================================================= -->

    <!-- Lottie Animation js  -->
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</body>

</html>
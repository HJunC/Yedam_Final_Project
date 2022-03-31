package co.yd.deval.project.web;

import co.yd.deval.project.service.ProjectService;
import co.yd.deval.project.service.ProjectVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/project")
public class RestProjectController {

    private final ProjectService projectDao;

    public RestProjectController(ProjectService projectDao) {
        this.projectDao = projectDao;
    }

    @GetMapping("/api/searchProject")
    public List<ProjectVO> searchApi(ProjectVO vo) {
        return projectDao.searchProject(vo);
    }

}

package co.yd.deval.board.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.yd.deval.board.mapper.FileManageMapper;
import co.yd.deval.board.service.FileManageService;
import co.yd.deval.board.service.FileManageVO;


@Service("fileManageDao")
public class FileManageImpl implements FileManageService {

	@Autowired
	private FileManageMapper map;

	@Override
	public int fileManageInsert(FileManageVO vo) {
		return map.fileManageInsert(vo);

	}

}

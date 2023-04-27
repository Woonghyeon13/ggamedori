package game.dori.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import game.dori.dao.SearchDAO;
import game.dori.service.SearchService;
import game.dori.util.OTO_VO;
import game.dori.vo.MEMBER_VO;
import game.dori.vo.NOTICE_VO;
import game.dori.vo.QA_VO;

@Service
public class SearchServiceImpl implements SearchService {

    @Autowired
    private SearchDAO searchDAO;

    @Override
    public List<MEMBER_VO> mSearch(String searchText, String searchOption, int start, int limit) {
        return searchDAO.mSearch(searchText, searchOption, start, limit);
    }

    @Override
    public int mCountSearchResults(String searchText, String searchOption) {
        return searchDAO.mCountSearchResults(searchText, searchOption);
    }

    @Override
    public List<OTO_VO> oto_search(String searchText, String searchOption, int start, int limit) {
        return searchDAO.oto_search(searchText, searchOption, start, limit);
    }

    @Override
    public int oto_countSearchResults(String searchText, String searchOption) {
        return searchDAO.oto_countSearchResults(searchText, searchOption);
    }

    @Override
    public List<NOTICE_VO> notice_search(String searchText, String searchOption, int start, int limit) {
        return searchDAO.notice_search(searchText, searchOption, start, limit);
    }

    @Override
    public int notice_countSearchResults(String searchText, String searchOption) {
        return searchDAO.notice_countSearchResults(searchText, searchOption);
    }

}
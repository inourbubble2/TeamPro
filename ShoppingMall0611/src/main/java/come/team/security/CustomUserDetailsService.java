package come.team.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import come.team.domain.MemberVO;
import come.team.mapper.MemberMapper;
import come.team.security.domain.CustomUser;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Setter(onMethod_ = { @Autowired })
	private MemberMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		log.warn("Load User By UserName : " + userName);
		
		// userName means userid
		MemberVO vo = userMapper.read(userName);
		log.warn("queried by member mapper: " + vo);
		return vo == null ? null : new CustomUser(vo);
	} 

}
